const getStars = () => {

  const star1 = document.getElementById('star1');
  const star2 = document.getElementById('star2');
  const star3 = document.getElementById('star3');
  const star4 = document.getElementById('star4');
  const star5 = document.getElementById('star5');


  const stars = [star1, star2, star3, star4, star5];

  stars.forEach((star, index) => {
    star.addEventListener('mouseover', (event) => {
      event.target.classList.toggle('far');
      event.target.classList.toggle('fas');
    });
  });

  // star1.addEventListener('mouseover', (event) => {
  //   event.target.classList.toggle('far')
  //   event.target.classList.toggle('fas')
  //   if (star2.classList[2] === "fas") {
  //     star2.classList.remove("fas")
  //     star2.classList.add('far')
  //   }
  //   if (star3.classList[3] == "fas") {
  //     star2.classList.remove("fas")
  //     star2.classList.add('far')
  //   }

  // });

  // star2.addEventListener('mouseover', (event) => {
  //   event.target.classList.toggle('far')
  //   event.target.classList.toggle('fas')
  //   star1.classList.remove('far')
  //   star1.classList.add('fas')
  // });

  if (star1 !== null ) {
    console.log(star1);
    console.log(star2);
    console.log(star3);
    console.log(star4);
    console.log(star5);
  }
}

export { getStars }
