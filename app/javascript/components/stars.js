const getStars = () => {

  const star1 = document.getElementById('star1');
  const star2 = document.getElementById('star2');
  const star3 = document.getElementById('star3');
  const star4 = document.getElementById('star4');
  const star5 = document.getElementById('star5');


  return [star1, star2, star3, star4, star5];
}

const getInputRating = () => {
  return document.getElementById('review_stars')
}

const updateStars = () => {
  const stars = getStars();
  const input_star = getInputRating();
  stars.forEach((star, index) => {
    star.addEventListener('mouseover', (event) => {
      if (isSwitchOff(event.target)) {
        switchOn(event.target)
        var counter = index;
        while (counter > 0) {
          counter -= 1
          if (isSwitchOff(stars[counter])) {
            switchOn(stars[counter])
          }
        }
        counter = index;
        while(counter < 4) {
          counter += 1
          if (isSwitchOn(stars[counter])) {
            switchOff(stars[counter])
          }
        }
      } else {
        switchOff(event.target);
        var counter = index;
        while(counter < 4) {
          counter += 1
          if (isSwitchOn(stars[counter])) {
            switchOff(stars[counter])
          }
        }
      }
    });

    star.addEventListener('mouseout', (event) => {
      updateReviewInput(stars, index, input_star);
    });

  });
}

const switchOn = (element) => {
  element.classList.remove('far'); // allumer
  element.classList.add('fas'); // alumer
}

const switchOff = (element) => {
  element.classList.add('far');
  element.classList.remove('fas');
}

const isSwitchOff = (element) => {
  return element.classList[2] === 'far'
}

const isSwitchOn = (element) => {
  return element.classList[2] === 'fas'
}

const updateReviewInput = (stars, index, input) => {
  var rating = 0;
  stars.forEach( (star) => {
    if(isSwitchOn(star)) {
      rating += 1;
    }
  });
  input.value = rating;
}

export { updateStars }
