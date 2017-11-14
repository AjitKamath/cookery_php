<?php
    include_once('../util/import_util.php');

    $filename = "submitrecipe.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id        = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    $rcp_nm         = isset($_POST['rcp_nm']) ? $_POST['rcp_nm'] : '';
    $food_csn_nm    = isset($_POST['food_csn_nm']) ? $_POST['food_csn_nm'] : '';
    $ing_id         = isset($_POST['ing_id']) ? $_POST['ing_id'] : '';
    $ing_nm         = isset($_POST['ing_nm']) ? $_POST['ing_nm'] : '';
    $qty_id         = isset($_POST['qty_id']) ? $_POST['qty_id'] : '';
    $ing_qty        = isset($_POST['ing_qty']) ? $_POST['ing_qty'] : '';
    $rcp_proc       = isset($_POST['rcp_proc']) ? $_POST['rcp_proc'] : '';
    $rcp_steps       = isset($_POST['rcp_steps']) ? $_POST['rcp_steps'] : '';
    $rcp_plating    = isset($_POST['rcp_plating']) ? $_POST['rcp_plating'] : '';
    $rcp_note       = isset($_POST['rcp_note']) ? $_POST['rcp_note'] : '';
    $tst_id         = isset($_POST['tst_id']) ? $_POST['tst_id'] : '';
    $tst_qty        = isset($_POST['tst_qty']) ? $_POST['tst_qty'] : '';
    $food_typ_id    = isset($_POST['food_typ_id']) ? $_POST['food_typ_id'] : '';
    $user_id        = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    $rcp_images     = $_FILES['images'];

    logger($filename, "I", "REQUEST PARAM : rcp_nm(".$rcp_nm.")");
    logger($filename, "I", "REQUEST PARAM : food_csn_nm(".$food_csn_nm.")");
    logger($filename, "I", "REQUEST PARAM : rcp_proc(".$rcp_proc.")");
    logger($filename, "I", "REQUEST PARAM : rcp_plating(".$rcp_plating.")");
    logger($filename, "I", "REQUEST PARAM : rcp_note(".$rcp_note.")");
    logger($filename, "I", "REQUEST PARAM : food_typ_id(".$food_typ_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");

    //arrays
    //hard code recipe steps
    $rcp_steps[0] = "Boil half litre water.";
    $rcp_steps[1] = "Cut all the vegetables into dices.";
    $rcp_steps[2] = "Heat the oil in frying pan on medium flame.";
    $rcp_steps[3] = "Soak chicken in the marination.";
    $rcp_steps[4] = "Cook chicken with medium heat in the oven.";
    $rcp_steps[5] = "Serve it hot with tabasco sause.";
    //hard code recipe steps

    for ($i = 0; $i < count($rcp_steps); $i++) {
        logger($filename, "I", "REQUEST PARAM : rcp_steps[".$i."](".$rcp_steps[$i].")");
    }

    for ($i = 0; $i < count($ing_id); $i++) {
        logger($filename, "I", "REQUEST PARAM : ing_id[".$i."](".$ing_id[$i].")");
    }

    for ($i = 0; $i < count($ing_nm); $i++) {
        logger($filename, "I", "REQUEST PARAM : ing_nm[".$i."](".$ing_nm[$i].")");
    }

    for ($i = 0; $i < count($qty_id); $i++) {
        logger($filename, "I", "REQUEST PARAM : qty_id[".$i."](".$qty_id[$i].")");
    }

    for ($i = 0; $i < count($qty_id); $i++) {
        logger($filename, "I", "REQUEST PARAM : qty_id[".$i."](".$qty_id[$i].")");
    }

    for ($i = 0; $i < count($tst_id); $i++) {
        logger($filename, "I", "REQUEST PARAM : tst_id[".$i."](".$tst_id[$i].")");
    }

    for ($i = 0; $i < count($tst_qty); $i++) {
        logger($filename, "I", "REQUEST PARAM : tst_qty[".$i."](".$tst_qty[$i].")");
    }

    for ($i = 0; $i < count($rcp_images['tmp_name']); $i++) {
        logger($filename, "I", "REQUEST PARAM : rcp_images[".$i."](".$rcp_images['tmp_name'][$i].")");
    } 
    //arrays
    //request

    //check for null/empty
    //mandatory
    if(!check_for_null($user_id)){
        logger($filename, "E", "Error ! null/empty user_id)");
        return;
    }

    if(!check_for_null($rcp_nm)){
        logger($filename, "E", "Error ! null/empty rcp_nm");
        return;
    }

    if(!check_for_null($food_typ_id)){
        logger($filename, "E", "Error ! null/empty food_typ_id");
        return;
    }

    if(!check_for_null($food_csn_nm)){
        logger($filename, "E", "Error ! null/empty food_csn_nm");
        return;
    }

    if(count($ing_id) == 0){
        logger($filename, "E", "Error ! null/empty ing_id");
        return;
    }

    if(!check_for_null($qty_id)){
        logger($filename, "E", "Error ! null/empty qty_id");
        return;
    }

    if(!check_for_null($ing_qty)){
        logger($filename, "E", "Error ! null/empty ing_qty");
        return;
    }
    
    if(!check_for_null($rcp_proc)){
        logger($filename, "E", "Error ! null/empty rcp_proc");
        return;
    }

    if(!check_for_null($tst_id)){
        logger($filename, "E", "Error ! null/empty tst_id");
        return;
    }

    if(!check_for_null($tst_qty)){
        logger($filename, "E", "Error ! null/empty tst_qty");
        return;
    }  

    if(count($rcp_images['name']) == 0){
        logger($filename, "E", "Error ! null/empty rcp_images");
        return;
    }

    if(count($rcp_steps) == 0){
        logger($filename, "E", "Error ! null/empty rcp_steps");
        return;
    }
    //mandatory
    
    //optional
    if(!check_for_null($rcp_id)){
        logger($filename, "I", "null/empty rcp_id");
    }

    if(!check_for_null($ing_nm)){
        logger($filename, "I", "null/empty ing_nm");
    }

    if(!check_for_null($rcp_plating)){
        logger($filename, "I", "null/empty rcp_plating");
    }

    if(!check_for_null($rcp_note)){
        logger($filename, "I", "null/empty rcp_note");
    }
    //optional
    //check for null/empty

    //validations
    $ing_count = count($ing_id);
    if(count($ing_nm) != $ing_count || count($ing_qty) != $ing_count || count($qty_id) != $ing_count){
        
    }
    //validations

    try{
        $con = DatabaseUtil::getInstance()->open_connection();

        //submit recipe transaction begins here
        mysqli_begin_transaction($con, MYSQLI_TRANS_START_READ_WRITE);
        mysqli_autocommit($con, FALSE);

        //if the $rcp_id is not null/empty, user is updating an old recipe
        if(check_for_null($rcp_id)){
            logger($filename, "I", "User(".$user_id.") is updating an old Recipe(".$rcp_id.")");
            
            //update recipe
            //update RECIPE table
            $query = "UPDATE `RECIPE` SET `RCP_NAME` = '".."', `FOOD_TYP_ID` = '".."', `FOOD_CSN_ID` = '".."', `RCP_PROC` = '".."', 
                      `RCP_PLATING` = '".."', `RCP_NOTE` = '".."', `MOD_DTM` = CURRENT_TIMESTAMP
                      WHERE RCP_ID = '".$rcp_id."'";
            if(mysqli_query($con, $query)){
                logger($filename, "I", "Recipe(".$rcp_id.") updated into RECIPE table by User(".$user_id.")");
                
                //delete the old ingredients in DISH table
                $query = "DELETE FROM `DISH` WHERE RCP_ID = '".$rcp_id."'";
                if(mysqli_query($con, $query)){
                    logger($filename, "I", "All Ingredients for Recipe(".$rcp_id.") are deleted from DISH table");
                }
                else{
                    logger($filename, "E", "Error ! Failed to delete Ingredients for Recipe(".$rcp_id.") from DISH table.");
                    logger($filename, "E", "Failed query : ".$query);
                    logger($filename, "E", "Rolling back !");
                    throw new Exception("Failed to delete Ingredients for Recipe(".$rcp_id.") from DISH table.");
                }
                //delete the old ingredients in DISH table
                
                //update/insert ingredients into DISH table
                for($i = 0; $i< count($ing_id); $i++){
                    $temp_ing_id = $ing_id[$i];

                    //if the $ing_id[i] is empty/null, user has entered custom ingredient. insert it in INGREDIENT table then in DISH table
                    if($temp_ing_id == null || $temp_ing_id == ''){
                        $query = "INSERT INTO `INGREDIENT` (`ING_NAME` , `CREATE_DTM`) VALUES ('$ing_nm' , CURRENT_TIMESTAMP)";
                        if(mysqli_query($con, $query)){
                            $temp_ing_id = mysqli_insert_id($con); 
                            logger($filename, "I", "Ingredient(".$temp_ing_id.") added into INGREDIENT table");
                        }
                        else{
                            logger($filename, "E", "Error ! Failed to insert into INGREDIENT table.");
                            logger($filename, "E", "Failed query : ".$query);
                            logger($filename, "E", "Rolling back !");
                            throw new Exception("Failed to insert into INGREDIENT table");
                        }
                    }
                    //if the $ing_id[i] is empty/null, user has entered custom ingredient. insert it in INGREDIENT table then in DISH table

                    //insert into DISH table
                    $query = "INSERT INTO `DISH` (`RCP_ID` , `ING_OR_AKA_ID` , `QTY_ID` , `ING_QTY` , `CREATE_DTM`) 
                                VALUES ('$rcp_id' , '$temp_ing_id' , '$qty_id[$i]' , '$ing_qty[$i]' , CURRENT_TIMESTAMP)";
                    if(mysqli_query($con, $query)){
                        $dish_id = mysqli_insert_id($con); 
                        logger($filename, "I", "Ingredient(".$dish_id.") added into DISH table");
                    }
                    else{
                        logger($filename, "E", "Error ! Failed to insert into DISH table.");
                        logger($filename, "E", "Failed query : ".$query);
                        logger($filename, "E", "Rolling back !");
                        throw new Exception("Failed to insert into DISH table");
                    }
                    //insert into DISH table
                }
                //insert ingredients into DISH table

                //delete the old recipe steps from RECIPE_STEPS table
                $query = "DELETE FROM `RECIPE_STEPS` WHERE RCP_ID = '".$rcp_id."'";
                if(mysqli_query($con, $query)){
                    logger($filename, "I", "All steps for Recipe(".$rcp_id.") are deleted from RECIPE_STEPS table");
                }
                else{
                    logger($filename, "E", "Error ! Failed to delete steps for Recipe(".$rcp_id.") from RECIPE_STEPS table.");
                    logger($filename, "E", "Failed query : ".$query);
                    logger($filename, "E", "Rolling back !");
                    throw new Exception("Failed to delete steps for Recipe(".$rcp_id.") from RECIPE_STEPS table.");
                }
                //delete the old recipe steps from RECIPE_STEPS table
                
                //insert recipe steps into RECIPE_STEPS table
                for($i = 0; $i< count($rcp_steps); $i++){
                    $query = "INSERT INTO `RECIPE_STEPS` (`RCP_ID` , `RCP_STEP` , `CREATE_DTM`) 
                              VALUES ('$rcp_id' , '$rcp_steps[$i]' , CURRENT_TIMESTAMP)";
                    if(mysqli_query($con, $query)){
                        $rcp_stps_id = mysqli_insert_id($con); 
                        logger($filename, "I", "Recipe Step(".$rcp_stps_id.") added into RECIPE_STEPS table");
                    }
                    else{
                        logger($filename, "E", "Error ! Failed to insert into RECIPE_STEPS table.");
                        logger($filename, "E", "Failed query : ".$query);
                        logger($filename, "E", "Rolling back !");
                        throw new Exception("Failed to insert into RECIPE_STEPS table");
                    }
                }
                //insert recipe steps into RECIPE_STEPS table

                //delete the old tastes from RECIPE_TASTE table
                $query = "DELETE FROM `RECIPE_TASTE` WHERE RCP_ID = '".$rcp_id."'";
                if(mysqli_query($con, $query)){
                    logger($filename, "I", "All tastes for Recipe(".$rcp_id.") are deleted from RECIPE_TASTE table");
                }
                else{
                    logger($filename, "E", "Error ! Failed to delete tastes for Recipe(".$rcp_id.") from RECIPE_TASTE table.");
                    logger($filename, "E", "Failed query : ".$query);
                    logger($filename, "E", "Rolling back !");
                    throw new Exception("Failed to delete tastes for Recipe(".$rcp_id.") from RECIPE_TASTE table.");
                }
                //delete the old recipe tastes from RECIPE_TASTE table
                
                //insert tastes into TASTE table
                for($i = 0; $i< count($tst_id); $i++){
                    $query = "INSERT INTO `RECIPE_TASTE` (`RCP_ID` , `TST_ID` , `TST_QTY` , `CREATE_DTM`)
                              VALUES ('$rcp_id' , '$tst_id[$i]' , '$tst_qty[$i]' , CURRENT_TIMESTAMP)";
                    if(mysqli_query($con, $query)){
                        $rcp_tst_id = mysqli_insert_id($con); 
                        logger($filename, "I", "Taste(".$rcp_tst_id.") added into DISH table");
                    }
                    else{
                        logger($filename, "E", "Error ! Failed to insert into RECIPE_TASTE table.");
                        logger($filename, "E", "Failed query : ".$query);
                        logger($filename, "E", "Rolling back !");
                        throw new Exception("Failed to insert into RECIPE_TASTE table");
                    }
                }
                //insert tastes into TASTE table
            }
            else{
                throw new Exception("Query failure : ".$dishsql);
            }
            //update RECIPE table

            //delete the old recipe images from RECIPE_IMG table
            $query = "DELETE FROM `RECIPE_IMG` WHERE RCP_ID = '".$rcp_id."'";
            if(mysqli_query($con, $query)){
                logger($filename, "I", "All images for Recipe(".$rcp_id.") are deleted from RECIPE_IMG table");
                
                //NOTE : not deleting the images from its phyiscal path as of now.
            }
            else{
                logger($filename, "E", "Error ! Failed to delete tastes for Recipe(".$rcp_id.") from RECIPE_TASTE table.");
                logger($filename, "E", "Failed query : ".$query);
                logger($filename, "E", "Rolling back !");
                throw new Exception("Failed to delete tastes for Recipe(".$rcp_id.") from RECIPE_TASTE table.");
            }
            //delete the old recipe tastes from RECIPE_TASTE table
            
            //upload images. if atleast one image is uploaded, warn the user but recipe must be added without rolling back
            //prepare directories
            if(!prepare_directories($user_id)){
                logger($filename, "E", "Cannot submit the recipe as the file directories could not be created for the user($user_id).");  
                logger($filename, "E", "Rolling back !");
                throw new Exception("Cannot submit the recipe as the file directories could not be created for the user($user_id).");
            }

            $recipe_images_dir = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_RECIPES_DIRECTORY.$rcp_id."/".APP_DATA_RECIPES_IMAGES_DIRECTORY;
            if(!create_directory($recipe_images_dir)){
                logger($filename, "E", "Error ! Failed to create directory(".$recipe_images_dir.")");
                logger($filename, "E", "Rolling back !");
                throw new Exception("Failed to create directory(".$recipe_images_dir.")");
            }
            //prepare directories

            $upload_failed = false;
            for($i = 0; $i< count($rcp_images['tmp_name']); $i++){
                try{
                    $recipe_image = $recipe_images_dir.uniqid().".jpg";

                    //insert into RECIPE_IMG table
                    $query = "INSERT INTO `RECIPE_IMG` (`RCP_ID` , `RCP_IMG`, `CREATE_DTM`) 
                              VALUES ('$rcp_id' , '".get_relative_path($recipe_image)."', CURRENT_TIMESTAMP)";   
                    if(mysqli_query($con, $query)){
                        $rcp_img_id = mysqli_insert_id($con); 
                        logger($filename, "I", "Recipe Image(".$rcp_img_id.") added into RECIPE_IMG table");
                    }
                    else{
                        logger($filename, "E", "Error ! Failed to insert into RECIPE_IMG table.");
                        logger($filename, "E", "Failed query : ".$query);
                        logger($filename, "E", "Rolling back !");
                        throw new Exception("Failed to insert into RECIPE_IMG table");
                    }
                    //insert into RECIPE_IMG table

                    if (isset($rcp_images['tmp_name'][$i])){
                        $tmpFilePath = $rcp_images['tmp_name'][$i];
                        move_uploaded_file($tmpFilePath, $recipe_image);
                        $atleast_one_uploaded = true;
                        logger($filename, "I", "Recipe Image(".$recipe_image.") uploaded");
                    }
                }
                catch(Exception $e){
                    logger($filename, "E", "Image upload fail exception : ".$e->getMessage());
                    $upload_failed = true;
                }
            }

            if(!$atleast_one_uploaded){
                logger($filename, "I", "Could not upload atleast one recipe image");
                logger($filename, "E", "Rolling back !");
                throw new Exception("Could not upload atleast one recipe image");
            }

            $response = array();
            if($upload_failed){
                $response['err_message'] = "Few of the images could not be uploaded !";
            }
            else{
                $response['err_message'] = "SUCCESS";
            }
            //upload images. if atleast one image is uploaded, warn the user but recipe mut be added without rolling back

            $response['isError'] = false;
            //update recipe
        }
        //if the $rcp_id is not null/empty, user is updating an old recipe
        //if the $rcp_id is null/empty, user is adding a new recipe
        else{
            logger($filename, "I", "User(".$user_id.") is adding a new Recipe");
            
            //add recipe
            //insert into RECIPE table
            $query = "INSERT INTO `RECIPE` (`RCP_NAME` , `FOOD_TYP_ID` , `FOOD_CSN_ID`, `RCP_PROC` , `RCP_PLATING` , `RCP_NOTE`,`USER_ID`, `CREATE_DTM`) 
                      VALUES ('$rcp_nm' , '$food_typ_id' , '$food_csn_nm' , '$rcp_proc' , '$rcp_plating' , '$rcp_note' , '$user_id' , CURRENT_TIMESTAMP)";
            if(mysqli_query($con, $query)){
                $rcp_id = mysqli_insert_id($con);
                logger($filename, "I", "Recipe(".$rcp_id.") added into RECIPE table by User(".$user_id.")");

                //insert ingredients into DISH table
                for($i = 0; $i< count($ing_id); $i++){
                    $temp_ing_id = $ing_id[$i];

                    //if the $ing_id[i] is empty/null, user has entered custom ingredient. insert it in INGREDIENT table then in DISH table
                    if($temp_ing_id == null || $temp_ing_id == ''){
                        $query = "INSERT INTO `INGREDIENT` (`ING_NAME` , `CREATE_DTM`) VALUES ('$ing_nm' , CURRENT_TIMESTAMP)";
                        if(mysqli_query($con, $query)){
                            $temp_ing_id = mysqli_insert_id($con); 
                            logger($filename, "I", "Ingredient(".$temp_ing_id.") added into INGREDIENT table");
                        }
                        else{
                            logger($filename, "E", "Error ! Failed to insert into INGREDIENT table.");
                            logger($filename, "E", "Failed query : ".$query);
                            logger($filename, "E", "Rolling back !");
                            throw new Exception("Failed to insert into INGREDIENT table");
                        }
                    }
                    //if the $ing_id[i] is empty/null, user has entered custom ingredient. insert it in INGREDIENT table then in DISH table

                    //insert into DISH table
                    $query = "INSERT INTO `DISH` (`RCP_ID` , `ING_OR_AKA_ID` , `QTY_ID` , `ING_QTY` , `CREATE_DTM`) 
                                VALUES ('$rcp_id' , '$temp_ing_id' , '$qty_id[$i]' , '$ing_qty[$i]' , CURRENT_TIMESTAMP)";
                    if(mysqli_query($con, $query)){
                        $dish_id = mysqli_insert_id($con); 
                        logger($filename, "I", "Ingredient(".$dish_id.") added into DISH table");
                    }
                    else{
                        logger($filename, "E", "Error ! Failed to insert into DISH table.");
                        logger($filename, "E", "Failed query : ".$query);
                        logger($filename, "E", "Rolling back !");
                        throw new Exception("Failed to insert into DISH table");
                    }
                    //insert into DISH table
                }
                //insert ingredients into DISH table

                //insert recipe steps into RECIPE_STEPS table
                for($i = 0; $i< count($rcp_steps); $i++){
                    $query = "INSERT INTO `RECIPE_STEPS` (`RCP_ID` , `RCP_STEP` , `CREATE_DTM`) 
                              VALUES ('$rcp_id' , '$rcp_steps[$i]' , CURRENT_TIMESTAMP)";
                    if(mysqli_query($con, $query)){
                        $rcp_stps_id = mysqli_insert_id($con); 
                        logger($filename, "I", "Recipe Step(".$rcp_stps_id.") added into RECIPE_STEPS table");
                    }
                    else{
                        logger($filename, "E", "Error ! Failed to insert into RECIPE_STEPS table.");
                        logger($filename, "E", "Failed query : ".$query);
                        logger($filename, "E", "Rolling back !");
                        throw new Exception("Failed to insert into RECIPE_STEPS table");
                    }
                }
                //insert recipe steps into RECIPE_STEPS table

                //insert tastes into TASTE table
                for($i = 0; $i< count($tst_id); $i++){
                    $query = "INSERT INTO `RECIPE_TASTE` (`RCP_ID` , `TST_ID` , `TST_QTY` , `CREATE_DTM`)
                              VALUES ('$rcp_id' , '$tst_id[$i]' , '$tst_qty[$i]' , CURRENT_TIMESTAMP)";
                    if(mysqli_query($con, $query)){
                        $rcp_tst_id = mysqli_insert_id($con); 
                        logger($filename, "I", "Taste(".$rcp_tst_id.") added into DISH table");
                    }
                    else{
                        logger($filename, "E", "Error ! Failed to insert into RECIPE_TASTE table.");
                        logger($filename, "E", "Failed query : ".$query);
                        logger($filename, "E", "Rolling back !");
                        throw new Exception("Failed to insert into RECIPE_TASTE table");
                    }
                }
                //insert tastes into TASTE table
            }
            else{
                throw new Exception("Query failure : ".$dishsql);
            }
            //insert into RECIPE table

            //upload images. if atleast one image is uploaded, warn the user but recipe mut be added without rolling back
            //prepare directories
            if(!prepare_directories($user_id)){
                logger($filename, "E", "Cannot submit the recipe as the file directories could not be created for the user($user_id).");  
                logger($filename, "E", "Rolling back !");
                throw new Exception("Cannot submit the recipe as the file directories could not be created for the user($user_id).");
            }

            $recipe_images_dir = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_RECIPES_DIRECTORY.$rcp_id."/".APP_DATA_RECIPES_IMAGES_DIRECTORY;
            if(!create_directory($recipe_images_dir)){
                logger($filename, "E", "Error ! Failed to create directory(".$recipe_images_dir.")");
                logger($filename, "E", "Rolling back !");
                throw new Exception("Failed to create directory(".$recipe_images_dir.")");
            }
            //prepare directories

            $upload_failed = false;
            for($i = 0; $i< count($rcp_images['tmp_name']); $i++){
                try{
                    $recipe_image = $recipe_images_dir.uniqid().".jpg";

                    //insert into RECIPE_IMG table
                    $query = "INSERT INTO `RECIPE_IMG` (`RCP_ID` , `RCP_IMG`, `CREATE_DTM`) 
                              VALUES ('$rcp_id' , '".get_relative_path($recipe_image)."', CURRENT_TIMESTAMP)";   
                    if(mysqli_query($con, $query)){
                        $rcp_img_id = mysqli_insert_id($con); 
                        logger($filename, "I", "Recipe Image(".$rcp_img_id.") added into RECIPE_IMG table");
                    }
                    else{
                        logger($filename, "E", "Error ! Failed to insert into RECIPE_IMG table.");
                        logger($filename, "E", "Failed query : ".$query);
                        logger($filename, "E", "Rolling back !");
                        throw new Exception("Failed to insert into RECIPE_IMG table");
                    }
                    //insert into RECIPE_IMG table

                    if (isset($rcp_images['tmp_name'][$i])){
                        $tmpFilePath = $rcp_images['tmp_name'][$i];
                        move_uploaded_file($tmpFilePath, $recipe_image);
                        $atleast_one_uploaded = true;
                        logger($filename, "I", "Recipe Image(".$recipe_image.") uploaded");
                    }
                }
                catch(Exception $e){
                    logger($filename, "E", "Image upload fail exception : ".$e->getMessage());
                    $upload_failed = true;
                }
            }

            if(!$atleast_one_uploaded){
                logger($filename, "I", "Could not upload atleast one recipe image");
                logger($filename, "E", "Rolling back !");
                throw new Exception("Could not upload atleast one recipe image");
            }

            $response = array();
            if($upload_failed){
                $response['err_message'] = "Few of the images could not be uploaded !";
            }
            else{
                $response['err_message'] = "SUCCESS";
            }
            //upload images. if atleast one image is uploaded, warn the user but recipe mut be added without rolling back

            $response['isError'] = false;
            //add recipe
        }
        //if the $rcp_id is null/empty, user is adding a new recipe
        
        mysqli_commit($con);
        //submit recipe transaction ends here
        
        //response
        echo json_encode($response);
        //response
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
        $response['err_message'] = "FAIL";
        $response['isError'] = true;
        
        mysqli_rollback($con);
    }
    finally{
        DatabaseUtil::getInstance()->close_connection($con);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>