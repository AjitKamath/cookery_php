// Globals
var controller = "/private/web/admincontrolpanel/appcontext/controller.php";
var counter = 0;

function fetchIngredients()
{
	var key = "FETCH_INGREDIENTS";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
									$(".dataTableReport").html("");
									var response = $.parseJSON(data);
									if(response == null || response.length === 0)
									{
										$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:1425px">No Ingredients Found</td></tr>');
									}else
									{
                    for (i = 0; i < response.length; i++) 
                    {
                      var isactive = "INACTIVE";
                      var isregularised = "NO";
                      if(response[i].IS_DEL === 'N'){
                        isactive = "ACTIVE";
                      }
                      if(response[i].IS_REG === 'Y'){
                        isregularised = "YES";
                      }
                      $('.dataTableReport').append('<tr style="text-align:center;"><td style="width:6.8%"><span><input name="ing_id" type="checkbox" value="' + response[i].ING_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="ing_id">' + response[i].ING_ID + '</label></span></td><td style="width:20.77%">' + response[i].ING_AKA_NAME + '</td><td style="width:9.3%">'+isregularised+'</td><td style="width:9.3%">'+isactive+'</td><td style="width:5%" onclick="editIngredient('+response[i].ING_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td></tr>');
                    }
									}
									}        
		 				});
	}

function fetchIngByCat()
{
  var selectedcategory = document.getElementById("category").value;
  fetchAvailableIngredientsUnderSelectedCategory(selectedcategory); 
}

function fetchNutritionCategory(nutcategory,nutrition,nutuom)
{
  var key = "FETCH_NUT_CATEGORY";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  var selectuser = document.getElementById(nutcategory);
                  for (j = 0; j < response.length; j++) 
                  {
                    var options = document.createElement('option');
                    options.value = response[j].NUT_CAT_ID;
                    options.text = response[j].NUT_CAT_NAME;
                    selectuser.add(options, 0);
                  } 
                  fetchSubNutritionCategory(nutcategory,nutrition,nutuom);
                }
            });
}

function fetchSubNutritionCategory(nutrientcategory,nutrition,nutuom)
{
  var nutcategory = $(nutrientcategory).val();
  
  var key = "FETCH_NUT_BY_CATEGORY";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
                              category: nutcategory
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  if(response.length > 0)
                  {
                    // Cleaning Existing values
                    $(nutrition).html('');
                    $(nutuom).html('');
                    
                    for (var j = 0; j < response.length; j++) 
                    {
                      var choices = document.createElement('option');
                      choices.value  = response[j].NUT_ID;
                      choices.text = response[j].NUT_NAME;
                      nutrition.add(choices, 0);
                    } 
                  }
                  else
                  {
                    // Cleaning Existing values
                    $(nutrition).html('');
                    $(nutuom).html('');
                  }
                }
            });
}


function fetchNutritionUOM(nutrition,nutritionuom)
{
  var nutriid = $(nutrition).val();
  
  var key = "FETCH_UOM_BY_NUT";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
                              category: nutriid
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  if(response.length > 0)
                  {
                    // Cleaning Existing values
                    $(nutritionuom).html('');
                    
                    for (var j = 0; j < response.length; j++) 
                    {
                      var options = document.createElement('option');
                      options.value = response[j].NUT_UOM_ID;
                      options.text = response[j].NUT_UOM_NAME;
                      nutritionuom.add(options, 0);
                    } 
                  }
                  else
                  {
                    // Cleaning Existing values
                    $(nutritionuom).html('');
                  }
                }
            }); 
}


function fetchCategories()
{
  var key = "FETCH_ING_CATEGORY";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  var selectuser = document.getElementById("category");
                  // Creating First element to make it optional
                    var options = document.createElement('option');
                    options.value = 0;
                    options.text  = "--New--";
                    selectuser.add(options, 0);
                  
                  for (j = 0; j < response.length; j++) 
                  {
                    options = document.createElement('option');
                    options.value = response[j].ING_CAT_ID;
                    options.text = response[j].ING_CAT_NAME;
                    selectuser.add(options, 0);
                  }
                  fetchAvailableIngredientsUnderSelectedCategory(0);
                }
            });
}

function fetchAvailableIngredientsUnderSelectedCategory(category)
{
  var key = "FETCH_ING_BY_CATEGORY";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
                              category: category
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  var selectuser = document.getElementById("availableingredientsunderselectedcategory");
                  if(response.length > 0)
                  {
                    // Cleaning Existing values
                    $('#availableingredientsunderselectedcategory').html('');
                    
                    // Creating First element to make it optional
                    choices = document.createElement('option');
                    choices.value = 0;
                    choices.text  = "--New--";
                    selectuser.add(choices, 0);
                    
                    for (var j = 0; j < response.length; j++) 
                    {
                      choices = document.createElement('option');
                      choices.value  = response[j].ING_AKA_ID;
                      choices.text = response[j].ING_AKA_NAME;
                      selectuser.add(choices, 0);
                    } 
                  }
                  else
                  {
                    // Cleaning Existing values
                    $('#availableingredientsunderselectedcategory').html('');
                    
                    choices = document.createElement('option');
                    choices.value = 0;
                    choices.text  = "--New--";
                    selectuser.add(choices, 0);
                  }
                }
            });
}

function fetchUsers()
{
	var key = "ADMIN_FETCH_USERS";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
									$(".dataTableReport").html("");
									var response = $.parseJSON(data);
									if(response == null || response.length === 0)
									{
										$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:1425px">No Users Found</td></tr>');
									}else
									{
                    for (i = 0; i < response.length; i++) 
											{
                        var isactive = "INACTIVE";
                        if(response[i].IS_DEL === "N")
                        {
                          isactive = "ACTIVE";
                        }
												$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:6.8%"><span><input name="user_id" type="checkbox" value="' + response[i].ADMIN_USER_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="user_id">' + response[i].ADMIN_USER_ID + '</label></span></td><td style="width:20.77%">' + response[i].ADMIN_USER_NAME + '</td><td style="width:9.3%">' + response[i].ADMIN_USER_ROLE+ '</td><td style="width:9.3%">' +isactive+ '</td><td style="width:5%" onclick="editAdminUserRole(\''+response[i].ADMIN_USER_ID+'\',\''+response[i].ADMIN_USER_NAME+'\',\''+response[i].ADMIN_USER_ROLE+'\')"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td></tr>');
											}
										
                  }
								}
            });
	}

function fetchFoodType(status)
{
  var key = "FETCH_FOOD_TYPE";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
									$(".dataTableReport").html("");
									var response = $.parseJSON(data);
									if(response == null || response.length === 0)
									{
										$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:1425px">No Food Type Found</td></tr>');
									}else
									{
                    var isactive = "N/A";
                    for (i = 0; i < response.length; i++) 
                    {
                      if(response[i].IS_DEL == "Y"){
                        isactive = "INACTIVE";
                      }
                      else{
                        isactive = "ACTIVE";
                      }
                      $('.dataTableReport').append('<tr style="text-align:center;"><td style="width:10%"><span><input name="food_type_id" type="checkbox" value="' + response[i].FOOD_TYP_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="food_type_id">' + response[i].FOOD_TYP_ID + '</label></span></td><td style="width:51%">' + response[i].FOOD_TYP_NAME + '</td><td style="width:28%">'+isactive+'</td><td style="width:9%" onclick="editfoodType('+response[i].FOOD_TYP_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td></tr>');
                    }
									}        
		 						}
            });
	}

function fetchFoodCuisine(status)
{
	var key = "FETCH_FOOD_CUISINE";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
									$(".dataTableReport").html("");
									var response = $.parseJSON(data);
									if(response == null || response.length === 0)
									{
										$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:1425px">No Food Cuisine Found</td></tr>');
									}else
									{
                    var isactive = "N/A";
                    for (i = 0; i < response.length; i++) 
                    { 
                      if(response[i].IS_DEL == "Y")
                      {
                        isactive = "INACTIVE";
                      }
                      else{
                        isactive = "ACTIVE";
                      }
                      $('.dataTableReport').append('<tr style="text-align:center;"><td><span><input name="food_csn_id" type="checkbox" value="' + response[i].FOOD_CSN_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="food_csn_id">' + response[i].FOOD_CSN_ID + '</label></span></td><td>' + response[i].FOOD_CSN_NAME + '</td><td>'+isactive+'</td><td onclick="editfoodCuisine('+response[i].FOOD_CSN_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td></tr>');
                    }
									}        
		 						}
            });
	}

function searchIngredient()
{
 var key = "SEARCH_INGRIDIENTS";
 var ingredientname = document.getElementById("ing_name_search").value;
	$.ajax({
						type			: "GET",
						url				: controller ,
						data			:
												{
													function_key: key,
													ing_name: ingredientname
												},
						success 	: function(data) 
						{ 
							$(".dataTableReport").html("");
              var response = $.parseJSON(data);
              if(response == null || response.length === 0)
              {
                $('.dataTableReport').append('<tr style="text-align:center;"><td style="width:1425px">No Ingredients Found</td></tr>');
              }else
              {
                for (i = 0; i < response.length; i++) 
                {
                  var isactive = "INACTIVE";
                  var isregularised = "NO";
                  if(response[i].IS_DEL === 'N'){
                    isactive = "ACTIVE";
                  }
                  if(response[i].IS_REG === 'Y'){
                    isregularised = "YES";
                  }
                  $('.dataTableReport').append('<tr style="text-align:center;"><td style="width:6.8%"><span><input name="ing_id" type="checkbox" value="' + response[i].ING_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="ing_id">' + response[i].ING_ID + '</label></span></td><td style="width:20.77%">' + response[i].ING_AKA_NAME + '</td><td style="width:9.3%">'+isregularised+'</td><td style="width:9.3%">'+isactive+'</td><td style="width:5%" onclick="editIngredient('+response[i].ING_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td></tr>');
                }
              }
						}
					});  
}

function searchFoodtype()
{
 var key = "SEARCH_FOOD_TYPE";
 var foodtypename = document.getElementById("foodtypenamesearch").value;
	$.ajax({
						type			: "GET",
						url				: controller ,
						data			:
												{
													function_key: key,
													foodtypename: foodtypename
												},
						success 	: function(data) 
						{ 
							$(".dataTableReport").html("");
              var response = $.parseJSON(data);
              if(response == null || response.length === 0)
              {
                $('.dataTableReport').append('<tr style="text-align:center;"><td>No Food Type Found</td></tr>');
              }else
              {
                var isactive = "N/A";
                for (i = 0; i < response.length; i++) 
                {
                  if(response[i].IS_DEL == "Y"){
                    isactive = "INACTIVE";
                  }
                  else{
                    isactive = "ACTIVE";
                  }
                  $('.dataTableReport').append('<tr style="text-align:center;"><td style="width:10%"><span><input name="food_type_id" type="checkbox" value="' + response[i].FOOD_TYP_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="food_type_id">' + response[i].FOOD_TYP_ID + '</label></span></td><td style="width:51%">' + response[i].FOOD_TYP_NAME + '</td><td style="width:28%">'+isactive+'</td><td style="width:9%" onclick="editfoodType('+response[i].FOOD_TYP_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td></tr>');
                }
              }
						}
					}); 
}

function searchCuisine()
{
 var key = "SEARCH_FOOD_CUISINE";
 var food_csn_name_search = document.getElementById("food_csn_name_search").value;
	$.ajax({
						type			: "GET",
						url				: controller ,
						data			:
												{
													function_key: key,
													food_csn_name_search: food_csn_name_search
												},
						success 	: function(data) 
						{  
              $(".dataTableReport").html("");
              var response = $.parseJSON(data);
              if(response == null || response.length === 0)
              {
                $('.dataTableReport').append('<tr style="text-align:center;"><td style="width:1425px">No Food Cuisine Found</td></tr>');
              }else
              {
                var isactive = "N/A";
                for (i = 0; i < response.length; i++) 
                { 
                  if(response[i].IS_DEL == "Y")
                  {
                    isactive = "INACTIVE";
                  }
                  else{
                    isactive = "ACTIVE";
                  }
                  $('.dataTableReport').append('<tr style="text-align:center;"><td><span><input name="food_csn_id" type="checkbox" value="' + response[i].FOOD_CSN_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="food_csn_id">' + response[i].FOOD_CSN_ID + '</label></span></td><td>' + response[i].FOOD_CSN_NAME + '</td><td>'+isactive+'</td><td onclick="editfoodCuisine('+response[i].FOOD_CSN_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td></tr>');
                }
              } 
            }
           });
}

function searchUser()
{
  var key = "SEARCH_USER";
 var user_name_search = document.getElementById("user_name_search").value;
	$.ajax({
						type			: "GET",
						url				: controller ,
						data			:
												{
													function_key: key,
													adminusername: user_name_search
												},
						success 	: function(data) 
						{  
             $(".dataTableReport").html("");
              var response = $.parseJSON(data);
              if(response == null || response.length === 0)
              {
                $('.dataTableReport').append('<tr style="text-align:center;"><td style="width:1425px">No Users Found</td></tr>');
              }else
              {
                for (i = 0; i < response.length; i++) 
                  {
                    var isactive = "INACTIVE";
                    if(response[i].IS_DEL === "N")
                    {
                      isactive = "ACTIVE";
                    }
                    $('.dataTableReport').append('<tr style="text-align:center;"><td style="width:6.8%"><span><input name="user_id" type="checkbox" value="' + response[i].ADMIN_USER_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="user_id">' + response[i].ADMIN_USER_ID + '</label></span></td><td style="width:20.77%">' + response[i].ADMIN_USER_NAME + '</td><td style="width:9.3%">' + response[i].ADMIN_USER_ROLE+ '</td><td style="width:9.3%">' +isactive+ '</td><td style="width:5%" onclick="editAdminUserRole(\''+response[i].ADMIN_USER_ID+'\',\''+response[i].ADMIN_USER_NAME+'\',\''+response[i].ADMIN_USER_ROLE+'\')"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td></tr>');
                  }
              } 
            }
           });
}

function editfoodType(type_id)
{
	var key = "EDIT_FOOD_TYPE";
	$.ajax({
						type			: "GET",
						url				: controller ,
						data			:
												{
													function_key: key,
													foodtypeid: type_id
												},
						success 	: function(data) 
						{ 
							var response = $.parseJSON(data);
							if(response.length !== 0 || response !== NULL)
							{
									$(".modal-body #food_type_id").val(type_id);
									$(".modal-body #foodtypename").val(response[0].FOOD_TYP_NAME);
									
									$('#myModal').modal('show');
							}
              else if(result == "ACCESS DENIED")
              {
                  bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
              }
							else
							{
									bootbox.alert("Error Occured");
							}
						}
					});

}

function editfoodCuisine(type_id)
{
	var key = "EDIT_FOOD_CUISINE";
	$.ajax({
						type			: "GET",
						url				: controller ,
						data			:
												{
													function_key: key,
													foodcsnid: type_id
												},
						success 	: function(data) 
						{ 
							var response = $.parseJSON(data);
							if(response.length !== 0 || response !== NULL)
							{
									$(".modal-body #food_csn_id").val(type_id);
									$(".modal-body #food_csn_name").val(response[0].FOOD_CSN_NAME);
									
									$('#myModal').modal('show');
							}
              else if(result == "ACCESS DENIED")
              {
                  bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
              }
							else
							{
									bootbox.alert("Error Occured");
							}
						}
					});

}

function editIngredient(type_id)
{
	var key = "EDIT_INGREDIENT";
	$.ajax({
						type			: "GET",
						url				: controller ,
						data			:
												{
													function_key: key,
													ingid: type_id
												},
						success 	: function(data) 
						{ 
							var response = $.parseJSON(data);
							if(response.length !== 0 || response !== NULL)
							{
									$(".modal-body #ing_id").val(type_id);
									$(".modal-body #ing_name").val(response[0].ING_AKA_NAME);
									
									$('#myModal').modal('show');
							}
              else if(result == "ACCESS DENIED")
              {
                  bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
              }
							else
							{
									bootbox.alert("Error Occured");
							}
						}
					});

}

function multipleIngredientDelete(checkboxName)
{
	var key = "MULTI_INGREDIENT_DELETE";
	var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
  Array.prototype.forEach.call(checkboxes, function(el) 
		{
        values.push(el.value);
    });
		if(values.length ===0)
		{
			bootbox.alert("No ingredient selected");
		}
		else
		{
			bootbox.confirm("Are you sure you want to delete ingredient with Ingredient Id " +values+ "?", function(result)
				{ 
					if(result)
					{
             $.ajax({
                        type		: "GET",
                        url			: controller ,
                        data		: 
																	{
																	 function_key: key,
																	 ingids: values
																	},
                				success : function(data) 
							 					{
													var response = $.parseJSON(data);
													var result = response.message;
													if(result == "success")
													{
												  		bootbox.alert("Ingredients deleted successfully ");
															location.reload();
													}
                          else if(result == "ACCESS DENIED")
                          {
                              bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                          }
													else
													{
															bootbox.alert("Error Occured");
													}
                        }
			         			});
	         }
					 else
					 {
		          bootbox.alert("Ingredients not Deleted");
	         }
				 })		
		}
	}

function multipleFoodTypeDelete(checkboxName)
{
	var key = "MULTI_FOOD_TYPE_DELETE";
	var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
  Array.prototype.forEach.call(checkboxes, function(el) 
		{
        values.push(el.value);
    });
		if(values.length ===0)
		{
			bootbox.alert("No Food type selected");
		}
		else
		{
			bootbox.confirm("Are you sure you want to delete Food type with Id " +values+ "?", function(result)
				{ 
					if(result)
					{
             $.ajax({
                        type		: "GET",
                        url			: controller ,
                        data		: 
																	{
																	 function_key: key,
																	 foodtypeids: values
																	},
                				success : function(data) 
							 					{
													var response = $.parseJSON(data);
													var result = response.message;
													if(result == "success")
													{
												  		bootbox.alert("Food Type/s deleted successfully ");
													}
                          else if(result == "ACCESS DENIED")
													{
												  		bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
													}
													else
													{
															bootbox.alert("Error Occured");
													}
                        }
			         			});
	         }
					 else
					 {
		          bootbox.alert("Food Type not Deleted");
	         }
				 })		
		}
	}

function multipleFoodCuisineDelete(checkboxName)
{
	var key = "MULTI_FOOD_CUISINE_DELETE";
	var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
  Array.prototype.forEach.call(checkboxes, function(el) 
		{
        values.push(el.value);
    });
		if(values.length ===0)
		{
			bootbox.alert("No Cuisine selected");
		}
		else
		{
			bootbox.confirm("Are you sure you want to delete Food Cuisine with Id " +values+ "?", function(result)
				{ 
					if(result)
					{
             $.ajax({
                        type		: "GET",
                        url			: controller ,
                        data		: 
																	{
																	 function_key: key,
																	 foodcuisineids: values
																	},
                				success : function(data) 
							 					{
													var response = $.parseJSON(data);
													var result = response.message;
													if(result == "success")
													{
												  		bootbox.alert("Food Cuisine deleted successfully ");
															location.reload();
													}
                          else if(result == "ACCESS DENIED")
                          {
                              bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                          }
													else
													{
															bootbox.alert("Error Occured");
													}
                        }
			         			});
	         }
					 else
					 {
		          bootbox.alert("Food Cuisine not Deleted");
	         }
				 })		
		}
	}

function multipleUserDelete(checkboxName)
{
 var key = "MULTI_ADMIN_USER_DELETE";
	var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
  Array.prototype.forEach.call(checkboxes, function(el) 
		{
        values.push(el.value);
    });
		if(values.length ===0)
		{
			bootbox.alert("No User selected");
		}
		else
		{
			bootbox.confirm("Are you sure you want to delete User/s with Id " +values+ "?", function(result)
				{ 
					if(result)
					{
             $.ajax({
                        type		: "GET",
                        url			: controller ,
                        data		: 
																	{
																	 function_key: key,
																	 userids: values
																	},
                				success : function(data) 
							 					{
													var response = $.parseJSON(data);
													var result = response.message;
													if(result == "success")
													{
												  		bootbox.alert("User/s deleted successfully ");
															location.reload();
													}
                          else if(result == "ACCESS DENIED")
                          {
                              bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                          }
													else
													{
															bootbox.alert("Error Occured");
													}
                        }
			         			});
	         }
					 else
					 {
		          bootbox.alert("User/s not Deleted");
	         }
				 })		
		} 
}

function deleteAdminUser(userid)
{
  var key = "DELETE_ADMIN_USER";
	bootbox.confirm("Are you sure you want to delete ?", function(result)
	{ 
		if(result)
		{
			$.ajax({
								type		: "GET",
				  			url			: controller ,
								data		: 
													{ 
													 function_key: key,	
													 userid: userid
													},
								success : function(data) 
								{ 
									var response = $.parseJSON(data);
									var result = response.message;
									if(result == "success")
									{
											bootbox.alert("Admin User deleted successfully ");
											location.reload();
									}
                  else if(result == "ACCESS DENIED")
                  {
                      bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                  }
									else
									{
											bootbox.alert("Error Occured");
									}
								}
			 			});
	    }
			else
			{
		  	  bootbox.alert("Admin User not Deleted");
	    }
	})
}

function deleteIngredient(ingid)
{
	var key = "DELETE_INGREDIENT";
	bootbox.confirm("Are you sure you want to delete ?", function(result)
	{ 
		if(result)
		{
			$.ajax({
								type		: "GET",
				  			url			: controller ,
								data		: 
													{ 
													 function_key: key,	
													 ingid: ingid
													},
								success : function(data) 
								{ 
									var response = $.parseJSON(data);
									var result = response.message;
									if(result == "success")
									{
											bootbox.alert("Ingredient deleted successfully ");
											location.reload();
									}
                  else if(result == "ACCESS DENIED")
                  {
                      bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                  }
									else
									{
											bootbox.alert("Error Occured");
									}
								}
			 			});
	    }
			else
			{
		  	  bootbox.alert("Ingredient not Deleted");
	    }
	})
}

function deleteFoodType(foodtypeid)
{
	var key = "DELETE_FOOD_TYPE";
	bootbox.confirm("Are you sure you want to delete ?", function(result)
	{ 
		if(result)
		{
			$.ajax({
								type		: "GET",
				  			url			: controller ,
								data		: 
													{ 
													 function_key: key,	
													 foodtypeid: foodtypeid
													},
								success : function(data) 
								{ 
									var response = $.parseJSON(data);
									var result = response.message;
									if(result == "success")
									{
											bootbox.alert("Food Type deleted successfully ");
											location.reload();
									}
                  else if(result == "ACCESS DENIED")
                  {
                      bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                  }
									else
									{
											bootbox.alert("Error Occured");
									}
								}
			 			});
	    }
			else
			{
		  	  bootbox.alert("Food Type not Deleted");
	    }
	})
}

function deleteFoodCuisine(foodcuisineid)
{
	var key = "DELETE_FOOD_CUISINE";
	bootbox.confirm("Are you sure you want to delete ?", function(result)
	{ 
		if(result)
		{
			$.ajax({
								type		: "GET",
				  			url			: controller ,
								data		: 
													{ 
													 function_key: key,	
													 foodcuisineid: foodcuisineid
													},
								success : function(data) 
								{ 
									var response = $.parseJSON(data);
									var result = response.message;
									if(result == "success")
									{
											bootbox.alert("Food Cuisine deleted successfully ");
											location.reload();
									}
                  else if(result == "ACCESS DENIED")
                  {
                      bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                  }
									else
									{
											bootbox.alert("Error Occured");
									}
								}
			 			});
	    }
			else
			{
		  	  bootbox.alert("Food Cuisine not Deleted");
	    }
	})
}

function updateIngredients()
{
	var key = "UPDATE_INGREDIENTS";
	var ing_id = document.getElementById("ing_id").value;
	var ing_name = document.getElementById("ing_name").value;
	var ing_aka_name = document.getElementById("ing_aka_name").value;
	
	$.ajax({
                type		: "GET",
                url			: controller ,
                data		: 
													{
														function_key:key,
														ingid:ing_id,				
														ing_name:ing_name,
														ing_aka_name:ing_aka_name
													},
                success : function(data) 
								{
									var response = $.parseJSON(data);
									var result = response.message;	
									if(result == "success")
									{
										bootbox.alert("Ingredient updated successfully");
									}
                  else if(result == "ACCESS DENIED")
                  {
                      bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                  }
									else
									{
										bootbox.alert("Error Occured");	
									}
								}
	});
}

function updateFoodType()
{
	var key = "UPDATE_FOOD_TYPE";
	var food_type_id = document.getElementById("food_type_id").value;
	var food_type_name = document.getElementById("foodtypename").value;
	
	$.ajax({
                type		: "GET",
                url			: controller ,
                data		: 
													{
														function_key:key,
														foodtypeid:food_type_id,				
														food_type_name:food_type_name	
													},
                success : function(data) 
								{
									var response = $.parseJSON(data);
									var result = response.message;	
									if(result == "success")
									{
										bootbox.alert("Food type updated successfully");
									}
                  else if(result == "ACCESS DENIED")
                  {
                      bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                  }
									else
									{
										bootbox.alert("Error Occured");	
									}
								}
	});
}

function updateFoodCuisine()
{
	var key = "UPDATE_FOOD_CUISINE";
	var food_csn_id = document.getElementById("food_csn_id").value;
	var food_csn_name = document.getElementById("food_csn_name").value;
	
	$.ajax({
                type		: "GET",
                url			: controller ,
                data		: 
													{
														function_key:key,
														foodcsnid:food_csn_id,				
														food_cuisine_name:food_csn_name	
													},
                success : function(data) 
								{
									var response = $.parseJSON(data);
									var result = response.message;	
									if(result == "success")
									{
										bootbox.alert("Food cuisine updated successfully");
									}
                  else if(result == "ACCESS DENIED")
                  {
                      bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                  }
									else
									{
										bootbox.alert("Error Occured");	
									}
								}
	});
}

function saveUser()
{
  var username = document.getElementById("user_name_add").value;
  var password = document.getElementById("user_password").value;
  var role     = document.getElementById("user_role").value;
  var mobile   = document.getElementById("user_mobile").value;
  var email    = document.getElementById("user_email").value;
  var key      = "ADMIN_SAVE_USER";
  
  $.ajax({
                type		: "GET",
                url			: controller ,
                data		: 
													{
														function_key          :key,
														adminusername         :username,				
                            adminuserpassword     :password,				
                            role                  :role,				
                            mobile                :mobile,				
                            email                 :email				
													},
                success  : function(data) 
								{
									var response = $.parseJSON(data);
									var result = response.message;	
									if(result == "success")
									{
										bootbox.alert("User added successfully");
                    setTimeout(function(){location.reload();},3000);
									}
                  else if(result == "exists")
									{
										bootbox.alert("User already exists");
									}
									else
									{
										bootbox.alert("Error Occured");
                    location.reload();
									}
								}
	});
}

function editAdminUserRole(userid, username, role)
{
  $(".modal-body #hid").val(userid);
  $(".modal-body #user_name_edit").val(username);
  $(".modal-body #edituser_role").val(role);
    
  $('#myModal').modal('show');
}

function updateAdminUserRole()
{
  var key = "UPDATE_ADMIN_USER_ROLE";
  var userid = document.getElementById("hid").value;
  var userrole = document.getElementById("edituser_role").value;
  
   $.ajax({
                type		: "GET",
                url			: controller ,
                data		: 
													{
														function_key  :key,
														userid        :userid,				
                            role          :userrole				
                          },
                success  : function(data) 
								{
									var response = $.parseJSON(data);
									var result = response.message;	
									if(result == "success")
									{
										bootbox.alert("User Role updated successfully");
									}
                  else if(result == "ACCESS DENIED")
                  {
                      bootbox.alert("ACCESS DENIED TO PERFORM THIS OPERATION");
                  }
									else
									{
										bootbox.alert("Error Occured");	
									}
								}
	});
  
}

function setUpFoodCuisine()
{
  setupFoodCuisineDashboard();
  fetchFoodCuisine(1)
}

function setUpIngredients()
{
  setUpIngredientsDashboard();
  fetchCategories();  // For ingredients
  fetchIngredients(); // For table Data
  addRow("ONLOAD");   // For Nutrition Data
}

function setUpFoodType()
{
  setUpFoodTypeDashboard();
  fetchFoodType(1);
}

function setUpUsers()
{
  setUpUsersDashboard();
  fetchUsers();
}

function setupFoodCuisineDashboard()
{
 var key = "SETUP_FOOD_CUISINE_DASHBOARD";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  $("#count").html(response[0].totalcount);
                  $("#type").html("CUISINES");
                  $("#active").html("ACTIVE CUISINES");
                  $("#activecount").html(response[0].activecount);
                  $("#inactive").html("INACTIVE CUISINES");
                  $("#inactivecount").html(response[0].inactivecount);
                } 
            })
}

function setUpMainDashboard()
{
 var key = "SETUP_MAIN_DASHBOARD";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  $("#recipecount").html(response[0].recipecount);
                  $("#liveusers").html(response[0].registercount);
                  $("#registercount").html(response[0].registercount);
                  
                  
                  $("#ipaddhighest").html(response[0].ip[0].ipadd ? response[0].ip[0].ipadd : 'Unknown');
                  $("#ipaddhighestcount").html(response[0].ip[0].ipaddcount);
                  $("#ipaddsecondhighest").html(response[0].ip[1].ipadd ? response[0].ip[1].ipadd : 'Unknown');
                  $("#ipaddsecondhighestcount").html(response[0].ip[1].ipaddcount);
                  $("#ipaddthirdhighest").html(response[0].ip[2].ipadd ? response[0].ip[2].ipadd : 'Unknown');
                  $("#ipaddthirdhighestcount").html(response[0].ip[2].ipaddcount);
                  $("#ipaddtotalcount").html(response[0].ipaddtotalcount);
                  
                  $("#areahighest").html(response[0].country[0].area ? response[0].country[0].area : 'Unknown');
                  $("#areahighestcount").html(response[0].country[0].areacount);
                  $("#areasecondhighest").html(response[0].country[1].area ? response[0].country[1].area : 'Unknown' );
                  $("#areasecondhighestcount").html(response[0].country[1].areacount);
                  $("#areathirdhighest").html(response[0].country[2].area ? response[0].country[2].area : 'Unknown');
                  $("#areathirdhighestcount").html(response[0].country[2].areacount);
                  $("#areatotalcount").html(response[0].areatotalcount);
                  
                  $("#cityhighest").html(response[0].city[0].city ? response[0].city[0].city: 'Unkwown');
                  $("#cityhighestcount").html(response[0].city[0].citycount);
                  $("#citysecondhighest").html(response[0].city[1].city ? response[0].city[1].city: 'Unkwown');
                  $("#citysecondhighestcount").html(response[0].city[1].citycount);
                  $("#citythirdhighest").html(response[0].city[2].city ? response[0].city[2].city: 'Unkwown');
                  $("#citythirdhighestcount").html(response[0].city[2].citycount);
                  $("#citytotalcount").html(response[0].citytotalcount);
                  
                  
                  
                  $("#useronedaycount").html(response[0].useronedaycount);
                  $("#useroneweekcount").html(response[0].useroneweekcount);
                  $("#useronemonthcount").html(response[0].useronemonthcount);
               } 
            })
}

function setUpFoodTypeDashboard()
{
 var key = "SETUP_FOOD_TYPE_DASHBOARD";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  $("#count").html(response[0].totalcount);
                  $("#type").html("FOOD TYPE");
                  $("#active").html("ACTIVE FOOD TYPES");
                  $("#activecount").html(response[0].activecount);
                  $("#inactive").html("INACTIVE FOOD TYPES");
                  $("#inactivecount").html(response[0].inactivecount);
                } 
            })
}

function setUpIngredientsDashboard()
{
 var key = "SETUP_INGREDIENTS_DASHBOARD";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  $("#count").html(response[0].totalcount);
                  $("#type").html("INGREDIENTS");
                  $("#active").html("ACTIVE INGREDIENTS");
                  $("#activecount").html(response[0].activecount);
                  $("#inactive").html("INACTIVE INGREDIENTS");
                  $("#inactivecount").html(response[0].inactivecount);
                } 
            })
}

function setUpUsersDashboard()
{
 var key = "SETUP_USERS_DASHBOARD";
			$.ajax({
								type			: "GET",
								url				: controller ,
								data			:
														{
															function_key: key,
														},
								success : function(data) 
								{
                  var response = $.parseJSON(data);
                  $("#count").html(response[0].totalcount);
                  $("#type").html("USERS");
                  $("#active").html("ACTIVE USERS");
                  $("#activecount").html(response[0].activecount);
                  $("#inactive").html("INACTIVE USERS");
                  $("#inactivecount").html(response[0].inactivecount);
                } 
            })
}

function showAddFoodType() {
  $('#AddFoodTypeModal').modal('show');
}

function showAddFoodCuisine() {
  $('#AddFoodCuisineModal').modal('show');
}

function showAddIngredient() {
  $('#AddIngredientModal').modal('show');
}

function addRow(source) {
        var newRow = $("<tr>");
        var cols = "";
        var dynamicnutritioncategoryid = "nutcategory"+counter;
        var dynamicnutritionid = "nut"+counter;
        var dynamicnutritionuomid = "nutuom"+counter;
        var dynamicnutritionvalueid = "nutval"+counter;
        
        if(source == "ONLOAD")
        {
            cols += '<td><select id = "'+dynamicnutritioncategoryid+'" name="nutcategory[]" onchange="fetchSubNutritionCategory('+dynamicnutritioncategoryid+','+dynamicnutritionid+','+dynamicnutritionuomid+')"></select></td>';
            cols += '<td><select id = "'+dynamicnutritionid+'" name="nut[]" onchange="fetchNutritionUOM('+dynamicnutritionid+','+dynamicnutritionuomid+')"></select></td>';
            cols += '<td><select id = "'+dynamicnutritionuomid+'" name="nutuom[]"></select></td>';
            cols += '<td><input type="text" class="form-control" id="'+dynamicnutritionvalueid+'" name="nutval[]" /></td>';
        }
        else
        {
            cols += '<td><select id = "'+dynamicnutritioncategoryid+'" name="nutcategory[]" onchange="fetchSubNutritionCategory('+dynamicnutritioncategoryid+','+dynamicnutritionid+','+dynamicnutritionuomid+')"></select></td>';
            cols += '<td><select id = "'+dynamicnutritionid+'" name="nut[]" onchange="fetchNutritionUOM('+dynamicnutritionid+','+dynamicnutritionuomid+')"></select></td>';
            cols += '<td><select id = "'+dynamicnutritionuomid+'" name="nutuom[]"></select></td>';
            cols += '<td><input type="text" class="form-control" id="'+dynamicnutritionvalueid+'" name="nutval[]" /></td>';
            cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
        }
        
        newRow.append(cols);
        $("table.order-list").append(newRow);
        counter++;
        fetchNutritionCategory(dynamicnutritioncategoryid,dynamicnutritionid,dynamicnutritionuomid);

    $("table.order-list").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        counter -= 1
    });


}
