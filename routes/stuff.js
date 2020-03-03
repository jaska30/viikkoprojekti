var express = require('express');
var router = express.Router();
var service = require('./service');


router.get('/', function(req, res, next) {
    service.getStuff((rows)=>{
      res.json(rows);
    })
});

router.get('/:id', function(req, res, next){
   service.getStuffById(req.params.id,(rows)=>{
    res.json(rows);
  })
})


router.post('/', function(req, res, next){
   service.insertStuff(req.body, (rowCount)=>{
     if(rowCount>0)
     res.status(201).json({message:'sinne jysähti'});
     else{
       res.status(400).json({message:'ei natsaa'});
     }
   })
})


router.put('/:id', function(req, res, next){
  service.updateStuff(req.body, req.params.id, (rowCount)=>{
    if(rowCount>0)
    res.status(200).json({message:'sinne jysähti'});
    else{
      res.status(400).json({message:'ei natsaa'});
    }
  })
})

router.delete('/:id', function(req, res, next){
  service.deleteStuff(req.params.id, (rowCount)=>{
    if(rowCount>0)
    res.status(200).json({message:'poistettu'});
    else{
      res.status(400).json({message:'error'});
    }
  })
})

module.exports = router;