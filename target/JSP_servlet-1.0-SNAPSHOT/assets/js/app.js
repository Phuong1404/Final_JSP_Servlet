//Open the search__option if the user clicks Search
var search_show = document.querySelector(".header-nav__search");
search_show.onclick = function () {
    document.querySelector(".search__option").classList.remove('hidden')
}

// Close the search__option if the user clicks outside of it
document.addEventListener('click', function (event) {
    var isClick = search_show.contains(event.target);
    if (!isClick) {
        document.querySelector(".search__option").classList.add('hidden')

    }
});
