var slide = document.getElementById("slider");
var btn1 = document.getElementById("btn-1");
var btn2 = document.getElementById("btn-2");
var btn3 = document.getElementById("btn-3");
var btn4 = document.getElementById("btn-4");
var btn5 = document.getElementById("btn-5");
btn1.onclick = function () {
    slide.style.transform = "translateX(0px)";
    btn1.classList.add("active");
    btn2.classList.remove("active");
    btn3.classList.remove("active");
    btn4.classList.remove("active");
    btn5.classList.remove("active");
}
btn2.onclick = function () {
    slide.style.transform = "translateX(-100%)";
    btn2.classList.add("active");
    btn1.classList.remove("active");
    btn3.classList.remove("active");
    btn4.classList.remove("active");
    btn5.classList.remove("active");
}
btn3.onclick = function () {
    slide.style.transform = "translateX(-200%)";
    btn3.classList.add("active");
    btn2.classList.remove("active");
    btn1.classList.remove("active");
    btn4.classList.remove("active");
    btn5.classList.remove("active");
}
btn4.onclick = function () {
    slide.style.transform = "translateX(-300%)";
    btn4.classList.add("active");
    btn2.classList.remove("active");
    btn3.classList.remove("active");
    btn1.classList.remove("active");
    btn5.classList.remove("active");
}
btn5.onclick = function () {
    slide.style.transform = "translateX(-400%)";
    btn5.classList.add("active");
    btn2.classList.remove("active");
    btn3.classList.remove("active");
    btn4.classList.remove("active");
    btn1.classList.remove("active");
}
