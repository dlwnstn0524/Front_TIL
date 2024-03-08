function load(){
  const balls = document.querySelectorAll(".ball");
  balls.forEach(e => {
    e.setAttribute("style", "display:none");
  });
}
function lotto() {
  console.log("!!");
  const nums = [];
  while(nums.length != 6){
    var num = Math.floor(Math.random() * 44) + 1;
    if (nums.indexOf(num) == -1) nums.push(num);
  }
  sorted = nums.sort((a, b) => a - b);
  const balls = document.querySelectorAll(".ball");
  
  for (var i = 0; i < 6; i++){
    balls[i].setAttribute("style", "display:none");
  }
  var idx = 0;
  var timer = setInterval(function () {
    if (idx == balls.length) {
      clearInterval(timer);
      return;
    }
    balls[idx].innerHTML = nums[idx];
    balls[idx].setAttribute("style", "display:block");
    idx++;
  }, 1000);
}