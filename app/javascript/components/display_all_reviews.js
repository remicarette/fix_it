
const btn = document.getElementById("more-button-review");
const contentReviews = document.querySelector(".display_btn_reviews");

const displayReviews = () => {
  btn.addEventListener("click", (event) => {
            // Do something (callback)
    if (contentReviews.style.display === "none") {
      contentReviews.style.display = "block";
      btn.innerText = "Masquer les avis";
    } else {
      contentReviews.style.display = "none";
      btn.innerText = "Plus d'avis";
    }
});
}

export { displayReviews };
