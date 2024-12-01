var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas", function (req, res) {
  console.log("Passando na rota");
  medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real", function (req, res) {
  medidaController.buscarMedidasEmTempoReal(req, res);
});

module.exports = router;
