<?php
    include 'application_context.php';
    include_once('constants.php');

    $filename = "addrecipe.php";
    $isError;
    $errorMessage;
    $exception;
    $userMessage;
    $response = array();

    $rcp_nm         = isset($_POST['rcp_nm']) ? $_POST['rcp_nm'] : '';
    $food_csn_nm    = isset($_POST['food_csn_nm']) ? $_POST['food_csn_nm'] : '';
    $ing_id         = isset($_POST['ing_id']) ? $_POST['ing_id'] : '';
    $ing_nm         = isset($_POST['ing_nm']) ? $_POST['ing_nm'] : '';
    $qty_id         = isset($_POST['qty_id']) ? $_POST['qty_id'] : '';
    $ing_qty        = isset($_POST['ing_qty']) ? $_POST['ing_qty'] : '';
    $rcp_proc       = isset($_POST['rcp_proc']) ? $_POST['rcp_proc'] : '';
    $rcp_plating    = isset($_POST['rcp_plating']) ? $_POST['rcp_plating'] : '';
    $rcp_note       = isset($_POST['rcp_note']) ? $_POST['rcp_note'] : '';
    $tst_id         = isset($_POST['tst_id']) ? $_POST['tst_id'] : '';
    $tst_qty        = isset($_POST['tst_qty']) ? $_POST['tst_qty'] : '';
    $food_typ_id    = isset($_POST['food_typ_id']) ? $_POST['food_typ_id'] : '';
    $user_id        = isset($_POST['user_id']) ? $_POST['user_id'] : '';

    //$rcp_img        = isset($_POST['rcp_img']) ? $_POST['rcp_img'] : '';



    /*
     *
     *
     *  ***********DATA*********************
     *
     *   RCP_NM will insert in RECIPE
     *   RCP_PROC will insert in RECIPE
     *   RCP_PLATING will insert in RECIPE
     *   RCP_NOTE will insert in RECIPE
     *   TST_ID will insert in RECIPE
     *   FOOD_TYP_ID will insert in RECIPE
     *   FOOD_CSN_ID will insert in RECIPE
     *
     *   ING_ID will insert in DISH
     *
     *   QTY_ID will insert in DISH (Based on QTY_NAME)
     *
     *   ING_QTY will insert in DISH
     *
     *   RCP_IMG will insert in RECIPE_IMG
     *
     *   TST_QTY will insert in RECIPE_TASTE
     *
     *
     *
     *  ************FLOW******************
     *  
     *  RECIPE
     *      RCP_ID - AG
     *      RCP_NM - APP
     *      FOOD_TYP_ID - APP
     *      FOOD_CSN_ID - APP
     *      TST_ID - APP
     *      RCP_PROC - APP
     *      RCP_PLATING - APP
     *      RCP_NOTE - APP
     *
     *  DISH
     *      DISH_ID - AG
     *      RCP_ID - RECIPE TABLE
     *      ING_OR_AKA_ID - APP
     *      QTY_ID - APP
     *      ING_QTY - APP
     *
     *  RECIPE_TASTE
     *      RCP_TST_ID - AG
     *      RCP_ID - RECIPE TABLE
     *      TST_ID - APP
     *      TST_QTY - APP
     *
     *  RECIPE_IMG
     *      RCP_IMG_ID - AG
     *      RCP_ID - RECIPE TABLE
     *      RCP_IMG - APP
     *
     *
     *
     *
     *      For other condition
     *         Insert first in master table than start flow from Recipe 
     *
     *  ************LOADED DATA (Pop-up)***
     *
     *  FOOD_CUISINE
     *  FOOD_TYP
     *  TASTES
     *  INGREDIENT
     *  
     */



 function addingredient($ing_nm)
    {
     try {
                $ingredientsql = "INSERT INTO `INGREDIENT` (`ING_NAME` , `CREATE_DTM`) VALUES ('$ing_nm' , CURRENT_TIMESTAMP)";                         

                $ing_id = $mysqli->insert_id;                                                       

                
                $mysqli->query($ingredientsql) ? null : $q0_ok=false;

                if(!$q0_ok)
                {
                    logger($filename, "E", "Query failure : ".$ingredientsql);
                    throw new Exception("Query failure : ".$ingredientsql);
                }
               else
               {
                    logger($filename, "I" , "New Ingredient added Successfully as ".$ing_nm);
               }
                
                $mysqli->commit();
            }
            catch(Exception $e)
            {
                $isError = true;
                $errorMessage = 'Query Failed';
                $exception = $e."MYSQL ERROR:";
                $userMessage = 'Could not add recipe. Please try again.';
                logger($filename, "E", $userMessage);
            
                $mysqli->rollback();

            }
      return $ing_id;
    }


 try {


        $mysqli->query("START TRANSACTION");

        $q1_ok = "true";
        $q2_ok = "true";
        $q3_ok = "true";
        $q4_ok = "true";

        $recipesql = "INSERT INTO `RECIPE` (`RCP_NAME` , `FOOD_TYP_ID` , `FOOD_CSN_ID`, `RCP_PROC` , `RCP_PLATING` , `RCP_NOTE`,`USER_ID`, `CREATE_DTM`) VALUES 
                                          ('$rcp_nm' , '$food_typ_id' , '$food_csn_nm' , '$rcp_proc' , '$rcp_plating' , '$rcp_note' , '$user_id' , CURRENT_TIMESTAMP)";

        
        $mysqli->query($recipesql) ? null : $q1_ok=false;

        if(!$q1_ok)
        {
           // include 'Logger.php';
            logger($filename, "E", "Query failure : ".$recipesql);
            throw new Exception("Query failure : ".$recipesql);
        }

        $rcp_id = $mysqli->insert_id;
      
        logger($filename, "I" , "New Recipe inserted but not committed to the table with recipe id as ".$rcp_id);  

        for($i = 0; $i< count($ing_id); $i++)
        {
          if($ing_id[$i] == '' || $ing_id[$i] == null)
          {
              $ing_id = addingredient($ing_nm[$i]); 
          }

            $dishsql = "INSERT INTO `DISH` (`RCP_ID` , `ING_OR_AKA_ID` , `QTY_ID` , `ING_QTY` , `CREATE_DTM`) VALUES
                                          ('$rcp_id' , '$ing_id[$i]' , '$qty_id[$i]' , '$ing_qty[$i]' , CURRENT_TIMESTAMP)";

            $mysqli->query($dishsql) ? null : $q2_ok=false;

            if(!$q2_ok)
            {
             //  include 'Logger.php';
                logger($filename, "E", "Query failure : ".$dishsql);
                throw new Exception("Query failure : ".$dishsql);
            }
            else
            {
              logger($filename, "I" , "Insertion in Dish table with recipe id as ".$rcp_id." and ingredient id as ".$ing_id[$i]." but not committed");  
            }

        }

        for($i = 0; $i< count($tst_id); $i++)
        {
          $recipetastesql = "INSERT INTO `RECIPE_TASTE` (`RCP_ID` , `TST_ID` , `TST_QTY` , `CREATE_DTM`)
                            VALUES ('$rcp_id' , '$tst_id[$i]' , '$tst_qty[$i]' , CURRENT_TIMESTAMP)";

          $mysqli->query($recipetastesql) ? null : $q3_ok=false;

          if(!$q3_ok)
          {
             //include 'Logger.php';
              logger($filename, "E", "Query failure : ".$recipetastesql);
              throw new Exception("Query failure : ".$recipetastesql);
          }
          else
          {
            logger($filename, "I" , "Insertion in RECIPE_TASTE table with recipe id as ".$rcp_id." and taste id as ".$tst_id[$i]." but not committed");  
          }
        }
        
        

        // For multiple images 

       // $target_path = "/opt/lampp/htdocs/cookery/images/appuploads/";
      $target_path = "/home/cabox/workspace/images/appuploads/";
      $target_path_rel = "/images/appuploads/";

   if($_SERVER['REQUEST_METHOD'] == 'POST')
      {
            $i = 0;
         try{
                while($i < count($_FILES['images']['name']))
                {
                    $filescount = count($_FILES['images']['name']);
                    $rcp_img = $target_path.$rcp_id.'plus'.$i.'.jpg';
                    $imgname = $_FILES['images']['name'];
                    if(move_uploaded_file($_FILES['images']['tmp_name'][$i],$target_path.$rcp_id.'plus'.$i.'.jpg'))
                    {
                       $rcp_img_path = $target_path_rel.$rcp_id.'plus'.$i.'.jpg';

                       $recipeimgtable = "INSERT INTO `RECIPE_IMG` (`RCP_ID` , `RCP_IMG`) VALUES ('$rcp_id' , '$rcp_img_path')";                                                                                
                       $mysqli->query($recipeimgtable) ? null : $q4_ok=false;

                        if(!$q4_ok)
                        {
                            logger($filename, "E", "Query failure : ".$recipeimgtable);
                            throw new Exception("Query failure : ".$recipeimgtable);
                        }
                        else
                        {
                            logger($filename, "I" , "Insertion in RECIPE_IMG table with recipe id as ".$rcp_id." and image no ".$i);  
                        }
                      
                        logger($filename, "I" , "Image uploaded successfully as ".$rcp_img_path);  
                    }
                    else
                    {
                       //include 'Logger.php';
                        logger($filename, "E", "Image upload Failed");
                        logger($filename, "E", "Failed upload image : ".$imgname);
                        $response['FAILED_IMG'] = $imgname;
                        //throw new Exception("Image upload Failed");
                    }

                    $i++;
                }
              }
             catch(Exception $e) 
             {
               logger($filename, "E", 'Message: ' .$e->getMessage());
                //echo 'Message: ' .$e->getMessage();
             }
       }


        // Check for all query are successful

        //if($q1_ok && $q2_ok && $q3_ok && $q4_ok)
        if($q1_ok && $q2_ok && $q3_ok)
        {
            $mysqli->commit();
            logger($filename, "I" , "Recipe Added Successfully with Recipe Id as ".$rcp_id);  
            $success = "Recipe added successfully";
            //echo json_encode($success); 
          echo $success; 
            
          //register timeline
            include_once('registerusertimeline.php');
            include_once('db_util.php');

            $con = open_connection();
            register_timeline($con, $user_id, $user_id, RECIPE_ADD, $rcp_id);
            close_connection($con);
          //register timeline
          
        }
    }
    catch(Exception $e)
    {
//       include 'Logger.php';
        $isError = true;
        $errorMessage = 'Query Failed';
        $exception = $e."MYSQL ERROR:";
        $userMessage = 'Could not add recipe. Please try again.';
        logger($filename, "E", $userMessage);
    
        $mysqli->rollback();

    }
?>