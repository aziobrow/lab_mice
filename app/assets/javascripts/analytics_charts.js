$( document ).ready(function() {


  $('#query').on("click", constructMouseQuery)

  var API = 'https://lit-meadow-75806.herokuapp.com/';
  var ploidyOne = "N/A";
  var ploidyTwo = "N/A";
  var dietOne = "N/A";
  var dietTwo = "N/A";
  var metricToGraph = "protein levels";
  var graphType = "line";
  var dataGroupOne;
  var dataGroupTwo;
  var labelsGroupOne;
  var labelsGroupTwo;
  var colors = [];
  var chart;


    var times = 30;
    for(var i=0; i < times; i++){
      colors.push(`rgb(${rand(0, 255)}, ${rand(0, 255)}, ${rand(0, 255)}`)
    }

    function rand(frm, to) {
      return ~~(Math.random() * (to - frm)) + frm;
    }

    $('#ploidyOne').change(function() {
      ploidyOne = $('#ploidyOne option:selected').text();
    })

    $('#ploidyTwo').change(function() {
      ploidyTwo = $('#ploidyTwo option:selected').text();
    })

    $('#dietOne').change(function() {
      dietOne = $('#dietOne option:selected').text();
    })

    $('#dietTwo').change(function() {
      dietTwo = $('#dietTwo option:selected').text();
    })

    $('#display-data').change(function() {
      var rawMetric = $('#display-data option:selected').text();
      if (rawMetric === 'protein levels') {
        metricToGraph = 'protein_ug_per_ml'
      } else if (rawMetric === 'harvest brain temperature') {
        metricToGraph = 'harvest_brain_temp'
      } else {
        metricToGraph = 'weight_in_grams'
      }
    })

    $('#graph-type').change(function() {
      graphType = $('#graph-type option:selected').text();
    })

  function constructMouseQuery()  {
    getGroupOneMice();
    getGroupTwoMice();
    console.log(ploidyOne)
    console.log(ploidyTwo)
    console.log(dietOne)
    console.log(dietTwo)
    console.log(metricToGraph)
    console.log(graphType)
    console.log(dataGroupOne)
    console.log(dataGroupTwo)
    console.log(labelsGroupOne)
    console.log(labelsGroupTwo)
    renderCharts();
  }

  function dataToDisplayGroupOne(array, type) {
    var filteredData = array.filter(mouse => mouse[type])
    var graphData = filteredData.reduce((accumulator, mouse) => {

      accumulator[mouse.original_id] = mouse[type]
      return accumulator
    }, {})
      dataGroupOne = Object.values(graphData)
      labelsGroupOne = Object.keys(graphData)
  }

  function dataToDisplayGroupTwo(array, type) {
    var filteredData = array.filter(mouse => mouse[type])
    var graphData = filteredData.reduce((accumulator, mouse) => {

      accumulator[mouse.original_id] = mouse.weight_in_grams
      return accumulator
    }, {})
      dataGroupTwo = Object.values(graphData)
      labelsGroupTwo = Object.keys(graphData)
  }

  function getGroupOneMice()  {

    if (ploidyOne != "N/A" && dietOne != "N/A") {
      fetch(`${API}/api/v1/mice/find?diet=${dietOne}&trisomic=${ploidyOne}`)
      .then(response => response.json())
      .then(data => {
        dataToDisplayGroupOne(data, metricToGraph)
      })
    } else if (ploidyOne === "N/A" || ploidyOne === null) {
      fetch(`${API}/api/v1/mice/find?diet=${dietOne}`)
      .then(response => response.json())
      .then(data => {
        dataToDisplayGroupOne(data, metricToGraph)
      })
    } else {
      fetch(`${API}/api/v1/mice/find?trisomic=${ploidyOne}`)
      .then(response => response.json())
      .then(data => {
        dataToDisplayGroupOne(data, metricToGraph)
      })
    }
  }

  function getGroupTwoMice()  {

    if (ploidyTwo != "N/A" && dietTwo != "N/A") {
      fetch(`${API}/api/v1/mice/find?diet=${dietTwo}&trisomic=${ploidyTwo}`)
      .then(response => response.json())
      .then(data => {
        dataToDisplayGroupTwo(data, metricToGraph)
      })
    } else if (ploidyTwo === "N/A" || ploidyTwo === null) {
      fetch(`${API}/api/v1/mice/find?diet=${dietTwo}`)
      .then(response => response.json())
      .then(data => {
        dataToDisplayGroupTwo(data, metricToGraph)
      })
    } else {
      fetch(`${API}/api/v1/mice/find?trisomic=${ploidyTwo}`)
      .then(response => response.json())
      .then(data => {
        dataToDisplayGroupTwo(data, metricToGraph)
      })
    }
  }


  function renderCharts()  {
    if (chart) {
      chart.chart.destroy()
    } else {
      var ctxOne = document.getElementById("myChartOne");
      var myChartOne = new Chart(ctxOne, {
        type: graphType,
        data: {
          labels: labelsGroupOne,
          datasets: [
            {
              data: dataGroupOne,
              label: 'Group 1',
              backgroundColor: '#223A5E'
            },
            {
              data: dataGroupTwo,
              label: 'Group 2',
              backgroundColor: '#838487'
            }
          ]
        },
        options:  {
          scales: {
            yAxes: [{
              scaleLabel: {
                display: true,
                labelString: metricToGraph,
                          }
                    }],
            xAxes: [{
              scaleLabel: {
                display: true,
                  labelString: 'mouse_id'
                          }
                    }]
                  },
          title:  {
            display: true,
            text: `Mice by ${metricToGraph}`,
            fontSize: 20
          }
                }
      });
    }
  }
  });
