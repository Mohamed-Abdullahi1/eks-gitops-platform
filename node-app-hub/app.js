const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

app.use(express.static(path.join(__dirname, "html")));

app.get("/health", (req, res) => {
  res.status(200).send("ok");
});

app.listen(PORT, () => {
  console.log(`App running on port ${PORT}`);
});