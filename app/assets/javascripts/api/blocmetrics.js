var blocmetrics = {};
blocmetrics.report = function(name){
  var _bm_request = new XMLHttpRequest();
  _bm_request.open("POST", "https://mtfarley-blocmetrics.herokuapp.com/api/events", true);
  _bm_request.setRequestHeader('Content-Type', 'application/json');
  _bm_request.send(JSON.stringify({event: {name: name}}));
}