== README

## Application name: mtfarley-blocmetrics

### https://mtfarley-blocmetrics.herokuapp.com/

#### by: Matthew Farley

Add the following url to a `script` tag to include `blocmetrics.report()` in your project:

`https://raw.githubusercontent.com/MatthewTFarley/blocmetrics/43af6b63d1184824d41354c9b1821840407f647a/app/assets/javascripts/api/blocmetrics.js`

Then you can do something like this to call the function and track an event of your choosing:

```jquery
$(document).ready(function() {
  $(document).on('click', function() {
    blocmetrics.report('a click');
  });
});
```