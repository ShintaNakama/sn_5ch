//window.onload = function() {
//  //let categoryForm = document.getElementById("categoryForm");
//  let addCategory  = document.getElementById("addCategoryForm");
//  let input = document.getElementById("post_category_name");
//  addCategory.onclick = function() {
//   document.getElementById("categoryForm").appendChild(input);
//  }
//};
$(document).on("click", ".add", function() {
  $(this).parent().clone(true).insertAfter($(this).parent());
});
$(document).on("click", ".del", function() {
  var target = $(this).parent();
  if (target.parent().children().length > 1) {
    target.remove();
  }
});
