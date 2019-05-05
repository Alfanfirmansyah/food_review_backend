var express = require('express');
var router = express.Router();
var con = require('../db.js')


/* GET users listing. */
router.get('/', function(req, res, next) {

  var sql = "Select * from restos"
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Result: " + result);
      res.send(result);
    });
  });


  router.get('/:id', function(req, res, next) {

    var sql = "Select * from restos WHERE id = "+req.params.id
      con.query(sql, function (err, result) {
        if (err) throw err;
        console.log("Result: " + result);
        res.send(result[0]);
      });
    });

  


module.exports = router;
