var express = require('express');
var router = express.Router();
var con = require('../db.js')

/* GET users listing. */
router.get('/', function(req, res, next) {
  if(req.query.foods_id){
    var sql = "SELECT reviews.*, SUBSTRING_INDEX(comment, ' ', 6) AS judulcomment from reviews WHERE foods_id = " +req.query.foods_id
    
      }
      else{
    
        var sql = "Select * from reviews"
      }

  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Result: " + result);
    res.send(result);
  });
});

router.get('/notify', function(req, res, next) {

  var paramdate = req.body.date
  var sql = "SELECT * FROM `reviews` WHERE created_at = "+mysql.escape(paramdate)
    con.query(sql, function (err, result) {
      if(result.length == 0){
        console.log("No Result: " + result);
        res.send(result[0]);
      }
      else{
        console.log("Result: " + result);
        res.send(result[0]);
      }
    });
  });

router.post('/', function(req, res, next) {
var date = new Date();

con.query("Insert into reviews values (?,?,?,?,?,?)",[
  null,
  req.body.name,
  req.body.comment,
  req.body.rating,
  req.body.foods_id,
  date
],function (err, result) {
  if (err) throw err;
  console.log("Result: " + result);
  res.send("OK");
}); 
});

module.exports = router;
