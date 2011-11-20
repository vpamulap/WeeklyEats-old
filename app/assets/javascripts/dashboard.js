$(document).ready(function(){
  //alert('javacsript file included!');
  
 $('.change_meal_link').live('click', function(){
    var $recipe_X = $('#recipe_X');
    var $this_recipe = $(this).parent().parent();

    //$recipe_X.show();
    //$this_recipe.hide();

    var tempHtml = $this_recipe.html();
    $this_recipe.html($recipe_X.html());
    $('#recipe_X').html(tempHtml);
  }); 
});
