// Based on reusable chart pattern from https://bost.ocks.org/mike/chart/
function gaugeChart() {
  var margin = {top: 0, right: 65, bottom: 10, left: 65},
      width = 300,
      height = 200,
      arcMin = -Math.PI/2,
      arcMax = Math.PI/2,
      innerRadius = 60,
      outerRadius = 80,
      dataDomain = [0, 50, 100],
      labelPad = 20,
      dataValue = function(d) { return +d; },
      colorScale = d3.scaleLinear(),
      arcScale = d3.scaleLinear(),
      colorOptions = ["#0040FF", "#0040FF", "#0040FF"],
      arc = d3.arc(),
      cst_arc = null,
      endOfValue = null,
      fontSize = "18px",
      fontColor = "#7A797A",
      tick = 5,
      lastInvisible = false;
     
      

  function chart(selection) {	  
    selection.each(function(data) {
      // Convert data to standard representation greedily;
      // this is needed for nondeterministic accessors.
      data = data.map(function(d, i) { return dataValue(d); });
      arcScale = d3.scaleLinear().domain(dataDomain).range([arcMin, 0, arcMax]);
      colorScale = d3.scaleLinear().domain(dataDomain).range(colorOptions);
      
      arc = d3.arc().innerRadius(innerRadius)
        .outerRadius(outerRadius)
        .startAngle( arcMin);
      
      if(data.length==2){
    	  cst_arc = d3.arc().innerRadius(innerRadius)
          .outerRadius(outerRadius)
          .startAngle( arcScale(data[0]));
      }

      // Select the svg element, if it exists.
      var svg = d3.select(this).selectAll("svg").data([data]);
      
      // Otherwise, create the skeletal chart.
      var gEnter = svg.enter().append("svg").append("g");
      var arcGEnter = gEnter.append("g").attr("class", "arc");
      arcGEnter.selectAll(".lines").data(arcScale.ticks(tick).map(function(d) { return { score: d }; })).enter() .append("path") .attr("class", "lines");
      arcGEnter.append("path").attr("class", "bg-arc");
      arcGEnter.append("path").attr("class", "data-arc")
        .datum({endAngle: (data.length==2?arcScale(data[0]):arcMin), startAngle: (data.length==2?arcScale(data[0]):arcMin), score: dataDomain[0]})
        .attr("d", (data.length==2?cst_arc:arc))
        .style("fill", colorScale(dataDomain[0]))
        .each(function(d) { this._current = d; });
      arcGEnter.append("text").attr("class", "arc-label");


     
      arcGEnter.selectAll(".ticks").data(arcScale.ticks(tick))
        .enter().append("text")
          .attr("class", "ticks");

      // Update the outer dimensions.
      var svg = selection.select("svg");
      svg.attr("width", width).attr("height", height);
      // Update the inner dimensions.
      var g = svg.select("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

      var arcG = svg.select("g.arc")
        .attr("transform", "translate(" +
          ((width - margin.left - margin.right) / 2) + "," +
          ((height * (2 / 3)) + ")"));

      svg.select("g.arc .bg-arc")
        .datum({endAngle: arcMax})
        .style("fill", "#ddd")
        .attr("d", arc);

      // https://bl.ocks.org/mbostock/1346410
      function arcTween(a) {
        var i = d3.interpolate(this._current, a);
        this._current = i(0);
        return function(t) {
          return (data.length==2?cst_arc(i(t)):arc(i(t)));
        };
      }

      var dataArc = svg.select("g.arc .data-arc")
        .datum({score: data[0], startAngle: arcMin, endAngle: (data.length==2?arcScale(data[1]==0?dataDomain[2]:data[1]):arcScale(data[0]))})
          .transition()
          .duration(750)
            .style("fill", function(d) { return colorScale(d.score); })
            .style("opacity", function(d) { return d.score < dataDomain[0] ? 0 : 1; })
            .attrTween("d", arcTween);

      var arcBox = svg.select("g.arc .bg-arc").node().getBBox();
      svg.select("text.arc-label")
        .datum({score: (data.length==2?(data[0]<10?(data[0]==0?"00":"0"+data[0]):data[0])+""+(data[1]<10?(data[1]==0?"70+":"0"+data[1]):data[1]):data[0]+endOfValue)})
        .attr("x", (arcBox.width/2)+arcBox.x)
        .attr("y", -15)
        .style("alignment-baseline", "central")
        .style("text-anchor", "middle")
        .style("font-size", fontSize)
        .style("fill", fontColor)
        .style("font-family","silkasemibold")
        .style("font-weight", "bold")
        .text(function(d) { return d.score; });

      var markerLine = d3.radialLine()
        .angle(function(d) { if(dataDomain[2]==d && lastInvisible){return null;}else{return arcScale(d);} })
        .radius(function(d, i) {
          return innerRadius + ((i % 2) * ((outerRadius - innerRadius + 6))) ;
        });
      
      
      arcG.selectAll(".lines")
      .attr("d", d => markerLine([d.score, d.score]))
      .style("fill", "none")
      .style("stroke-width", 1)
      .style("stroke", "#DDD");
      
      arcG.selectAll(".ticks")
        .style("font-size", "12px")
        .style("fill","#7A797A")
        .style("text-anchor", "middle")
        .style("font-family","silkasemibold")
        .attr("x", function(d) { return Math.cos(arcScale(d) + arcMin) * (outerRadius + labelPad); })
        .attr("y", function(d) {
          var yVal = Math.sin(arcScale(d) + arcMin) * (outerRadius + labelPad) + labelPad/4;
          return yVal < -1 ? yVal : 5;
        }).text(function(d) { if(dataDomain[2]==d && lastInvisible){return '';}else{return d;} });
    });
  }

  chart.margin = function(_) {
    if (!arguments.length) return margin;
    margin = _;
    return chart;
  };

  chart.width = function(_) {
    if (!arguments.length) return width;
    width = _;
    return chart;
  };

  chart.height = function(_) {
    if (!arguments.length) return height;
    height = _;
    return chart;
  };

  chart.innerRadius = function(_) {
    if (!arguments.length) return innerRadius;
    innerRadius = _;
    return chart;
  };

  chart.outerRadius = function(_) {
    if (!arguments.length) return outerRadius;
    outerRadius = _;
    return chart;
  };

  chart.dataDomain = function(_) {
    if (!arguments.length) return dataDomain;
    dataDomain = _;
    return chart;
  };

  chart.colorOptions = function(_) {
    if (!arguments.length) return colorOptions;
    colorOptions = _;
    return chart;
  };

  chart.labelPad = function(_) {
    if (!arguments.length) return labelPad;
    labelPad = _;
    return chart;
  };
  
  /* 20200630 ksw add */
  chart.endOfValue = function(_) {
	  if (!arguments.length) return endOfValue;
	  	endOfValue = _;
	    return chart;
  }

  /* 20200630 ksw add */
  chart.setColor = function(_) {
	  if (!arguments.length) return fontColor;
	  	fontColor = _;
	    return chart;
  }

  /* 20200630 ksw add */
  chart.setFontSize = function(_) {
	  if (!arguments.length) return fontSize;
	  	fontSize = _;
	    return chart;
  }
  
  /* 20200630 ksw add */
  chart.setTick = function(_) {
	  if (!arguments.length) return tick;
	  	tick = _;
	    return chart;
  }
  
  chart.lastInvisible = function(_) {
	  if (!arguments.length) return lastInvisible;
	  	lastInvisible = _;
	    return chart;
  }
  
  return chart;
}