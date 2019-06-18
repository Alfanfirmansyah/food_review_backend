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

  router.get('/countrestos', function(req, res, next) {

    var sql = "SELECT COUNT(id)as jumlah FROM restos"
      con.query(sql, function (err, result) {
        if (err) throw err;
        console.log("Result: " + result);
        res.send(result[0]);
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

    router.delete('/delete/:id', function(req, res, next) {

      var sql = "Delete from restos WHERE id = "+req.params.id
        con.query(sql, function (err, result) {
          if (err)
    return console.error(err.message);
 
  console.log('Deleted Row(s):', result.affectedRows);
  res.send('sukses');
        });
      });
      router.post('/addrestos', function(req, res, next) {
        var date = new Date();
        
        con.query("Insert into restos values (?,?,?,?,?,?)",[
          null,
          req.body.name,
          req.body.address,
          req.body.category,
          req.body.website,
          req.body.description
        ],function (err, result) {
          if (err) throw err;
          console.log("Result: " + result);
          res.send("OK");
        }); 
        });

        router.post('/update/:id', function(req, res, next) {
          var date = new Date();
          
          con.query(
            'UPDATE restos SET name = ?,address = ?,category = ?,website = ?,description=? WHERE id = ?', [
              req.body.name,
              req.body.address,
              req.body.category,
              req.body.website,
              req.body.description,
              req.params.id
            ],
            function (err, result) {
            if (err) throw err;
            console.log("Result: " + result);
            res.send("OK");
          }); 
          });

  


module.exports = router;
