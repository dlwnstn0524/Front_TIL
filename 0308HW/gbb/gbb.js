/*
* 0 : 가위, 1 : 바위, 2: 보
*/
function game(user) { 
  var com = Math.round(Math.random() * 2);
  var content = document.getElementById("rspWrapper");
  var res = document.getElementById("res");
  content.style.display = "none";
  res.style.display = "flex";
  if (user == 0) { // 사용자 가위
    if (com == 0) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "tie.png");
    }
    if (com == 1) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "lose.png");
    }
    if (com == 2) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "win.png");
    }
  }

  if (user == 1) { // 사용자 바위
    if (com == 1) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "tie.png");
    }
    if (com == 2) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "lose.png");
    }
    if (com == 0) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "win.png");
    }
  }

  if (user == 2) { // 사용자 보
    if (com == 2) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "tie.png");
    }
    if (com == 0) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "lose.png");
    }
    if (com == 1) {
      const wrapper = document.querySelector(".imgWrapper");
      var img = document.querySelector(".resImage");
      img.setAttribute("src", "win.png");
    }
  }
}

function newGame(){
  var content = document.getElementById("rspWrapper");
  var res = document.getElementById("res");
  content.style.display = "flex";
  res.style.display = "none";
}