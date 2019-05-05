var express = require('express');
var router = express.Router();

var con = require('../db.js')


/* GET users listing. */
router.get('/', function(req, res, next) {

  if(req.query.restos_id){ 

var sql = "select foods.*,AVG(reviews.rating) as rating FROM foods left join reviews on foods.id = reviews.foods_id where foods.restos_id = " +req.query.restos_id+ " GROUP BY foods.id"

  }
  else{

    var sql = "Select foods.*,avg(reviews.rating) as rating from foods left join reviews on foods.id = reviews.foods_id group by foods.id"
  }

  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Result: " + result);
    res.send(result);
  });
});


router.get('/:id', function(req, res, next) {

  var sql = "Select a.*,b.*,a.name as foodname from foods a join restos b on a.restos_id = b.id WHERE a.id = "+req.params.id
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Result: " + result);
      res.send(result[0]);
    });
  });


module.exports = router;
