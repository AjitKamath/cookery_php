function saveIngredient()
{
	var key = "SAVE_INGREDIENT"
	var ing_name = document.getElementById("ing_name").value;
	var ing_aka_name = document.getElementById("ing_aka_name").value;
	 $.ajax({
						type	    : "GET",
						url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
						data			:
												{
													function_key: key,
													ing_name: ing_name,
													ing_aka_name: ing_aka_name
												},
						success : function(data) 
						{ 
							var response = $.parseJSON(data);
							var result = response.message;
							if(result == "success")
							{
									bootbox.alert("Ingredient saved sucessfully");
							}
							else if(result == "exists")
							{
								bootbox.alert("Ingredient already exists");
							}
							else
							{
									bootbox.alert("Error Occured");	
							}
						}
					});
}


function saveFoodType()
{
	var key = "SAVE_FOOD_TYPE"
	var food_type_name = document.getElementById("food_type_name").value;
	 $.ajax({
						type	    : "GET",
						url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
						data			:
												{
													function_key: key,
													food_type_name: food_type_name
												},
						success : function(data) 
						{ 
							var response = $.parseJSON(data);
							var result = response.message;
							if(result == "success")
							{
									bootbox.alert("Food Type saved sucessfully");
							}
							else if(result == "exists")
							{
								bootbox.alert("Food Type already exists");
							}
							else
							{
									bootbox.alert("Error Occured");	
							}
						}
					});
}


function saveCuisine()
{
	var key = "SAVE_FOOD_CUISINE"
	var food_cuisine_name = document.getElementById("cuisine_name").value;
	 $.ajax({
						type	    : "GET",
						url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
						data			:
												{
													function_key: key,
													food_cuisine_name: food_cuisine_name
												},
						success : function(data) 
						{ 
							var response = $.parseJSON(data);
							var result = response.message;
							if(result == "success")
							{
									bootbox.alert("Food Cuisine saved sucessfully");
							}
							else if(result == "exists")
							{
								bootbox.alert("Food Cuisine already exists");
							}
							else
							{
									bootbox.alert("Error Occured");	
							}
						}
					});
}


function fetchIngredients(status)
{
	var key = "FETCH_INGREDIENTS";
			$.ajax({
								type			: "GET",
								url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
										if(status)
										{
											for (i = 0; i < response.length; i++) 
											{
												$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:6.8%"><span><input name="ing_id" type="checkbox" value="' + response[i].ING_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="ing_id">' + response[i].ING_ID + '</label></span></td><td style="width:20.77%">' + response[i].ING_NAME + '</td><td style="width:9.3%">' + response[i].ING_AKA_NAME + '</td><td style="width:9.3%">ACTIVE</td><td style="width:5%" onclick="editIngredient('+response[i].ING_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td><td style="width:5%" onclick="delete('+response[i].INGREDIENT_ID+')"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td></tr>');
											}
										}
										else
										{
											for (i = 0; i < response.length; i++) 
											{
												$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:6.8%"><span><input name="ing_id" type="checkbox" value="' + response[i].ING_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="ing_id">' + response[i].ING_ID + '</label></span></td><td style="width:20.77%">' + response[i].ING_NAME + '</td><td style="width:9.3%">' + response[i].ING_AKA_NAME + '</td><td style="width:5%" onclick="editIngredient('+response[i].ING_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td><td style="width:5%" onclick="delete('+response[i].QUSESTION_ID+')"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td></tr>');
											}
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
								url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
										if(status)
										{
											for (i = 0; i < response.length; i++) 
											{
												$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:10%"><span><input name="food_type_id" type="checkbox" value="' + response[i].FOOD_TYP_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="food_type_id">' + response[i].FOOD_TYP_ID + '</label></span></td><td style="width:51%">' + response[i].FOOD_TYP_NAME + '</td><td style="width:28%">ACTIVE</td><td style="width:9%" onclick="editfoodType('+response[i].FOOD_TYP_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td><td style="width:10%" onclick="delete('+response[i].FOOD_TYP_ID+')"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td></tr>');
											}
										}
										else
										{
											for (i = 0; i < response.length; i++) 
											{
												$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:10%"><span><input name="food_type_id" type="checkbox" value="' + response[i].FOOD_TYP_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="food_type_id">' + response[i].FOOD_TYP_ID + '</label></span></td><td style="width:51%">' + response[i].FOOD_TYP_NAME + '</td><td style="width:28%" onclick="editfoodType('+response[i].FOOD_TYP_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td><td style="width:10%" onclick="delete('+response[i].FOOD_TYP_ID+')"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td></tr>');
											}
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
								url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
										if(status)
										{
											for (i = 0; i < response.length; i++) 
											{
												$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:10%"><span><input name="food_csn_id" type="checkbox" value="' + response[i].FOOD_CSN_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="food_csn_id">' + response[i].FOOD_CSN_ID + '</label></span></td><td style="width:51%">' + response[i].FOOD_CSN_NAME + '</td><td style="width:28%">ACTIVE</td><td style="width:9%" onclick="editfoodCuisine('+response[i].FOOD_CSN_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td><td style="width:10%" onclick="delete('+response[i].FOOD_CSN_ID+')"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td></tr>');
											}
										}
										else
										{
											for (i = 0; i < response.length; i++) 
											{
												$('.dataTableReport').append('<tr style="text-align:center;"><td style="width:6.8%"><span><input name="food_csn_id" type="checkbox" value="' + response[i].FOOD_CSN_ID + '" style="margin-left: 5%;"/>&nbsp&nbsp&nbsp<label for="food_csn_id">' + response[i].FOOD_CSN_ID + '</label></span></td><td style="width:20.77%">' + response[i].FOOD_CSN_NAME + '</td><td style="width:5%" onclick="editfoodCuisine('+response[i].FOOD_CSN_ID+')"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></td><td style="width:5%" onclick="delete('+response[i].FOOD_CSN_ID+')"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></td></tr>');
											}
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
						url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
									$(".modal-body #food_type_name").val(response[0].FOOD_TYP_NAME);
									
									$('#myModal').modal('show');
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
						url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
						url				: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
									$(".modal-body #ing_name").val(response[0].ING_NAME);
									$(".modal-body #ing_aka_name").val(response[0].ING_AKA_NAME);
									
									$('#myModal').modal('show');
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
                        url			: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
                        url			: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
															location.reload();
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
			bootbox.alert("No ingredient selected");
		}
		else
		{
			bootbox.confirm("Are you sure you want to delete Food Cuisine with Id " +values+ "?", function(result)
				{ 
					if(result)
					{
             $.ajax({
                        type		: "GET",
                        url			: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
												  		bootbox.alert("Food Cuisine deleted successfully ");
															location.reload();
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

function updateIngredients()
{
	var key = "UPDATE_INGREDIENTS";
	var ing_id = document.getElementById("ing_id").value;
	var ing_name = document.getElementById("ing_name").value;
	var ing_aka_name = document.getElementById("ing_aka_name").value;
	
	$.ajax({
                type		: "GET",
                url			: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
										alert("Ingredient updated successfully");
									}
									else
									{
										alert("Error Occured");	
									}
								}
	});
}

function updateFoodType()
{
	var key = "UPDATE_FOOD_TYPE";
	var food_type_id = document.getElementById("food_type_id").value;
	var food_type_name = document.getElementById("food_type_name").value;
	
	$.ajax({
                type		: "GET",
                url			: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
										alert("Food type updated successfully");
									}
									else
									{
										alert("Error Occured");	
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
                url			: "/private/web/admincontrolpanel/appcontext/controller.php" ,
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
										alert("Food cuisine updated successfully");
									}
									else
									{
										alert("Error Occured");	
									}
								}
	});
}
