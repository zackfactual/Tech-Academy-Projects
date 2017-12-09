$(document).ready(function () {

    // MAKE PAGE RELOAD WHEN MODAL CLOSED
    $('#refresh').click(function() {
        location.reload();
    });

    // BEGIN CLICK FUNCTION
    $('#order').on('click',function () {

        // APPEND SIZE TO RECEIPT
        var subtotalSize = 6;
        if ($('#personal').is(':checked')) {
            $("#size").append("&bull; Personal");
        } else if ($('#medium').is(':checked')) {
            $("#size").append("&bull; Medium");
            subtotalSize = 10;
        } else if ($('#large').is(':checked')) {
            $("#size").append("&bull; Large");
            subtotalSize = 14;
        } else if ($('#extraLarge').is(':checked')) {
            $("#size").append("&bull; Extra Large");
            subtotalSize = 16;
        }

        // APPEND CRUST TO RECEIPT
        var subtotalCrust = 0;
        if ($('#plain').is(':checked')) {
            $("#crust").append("&bull; Plain");
        } else if ($('#garlicButter').is(':checked')) {
            $("#crust").append("&bull; Garlic Butter");
        } else if ($('#cheeseStuffed').is(':checked')) {
            $("#crust").append("&bull; Cheese Stuffed");
            var subtotalCrust = 3;
        } else if ($('#spicy').is(':checked')) {
            $("#crust").append("&bull; Spicy");
        } else if ($('#houseSpecial').is(':checked')) {
            $("#crust").append("&bull; House Special");
        }

        // APPEND SAUCE TO RECEIPT
        var subtotalSauce = 0;
        if ($('#marinara').is(':checked')) {
            $("#sauce").append("&bull; Marinara");
        } else if ($('#white').is(':checked')) {
            $("#sauce").append("&bull; White");
        } else if ($('#barbecue').is(':checked')) {
            $("#sauce").append("&bull; Barbecue");
        } else if ($('#noSauce').is(':checked')) {
            $("#sauce").append("&bull; No Sauce");
        }

        // APPEND CHEESE TO RECEIPT
        var subtotalCheese = 0;
        if ($('#regularCheese').is(':checked')) {
            $("#cheese").append("&bull; Regular");
        } else if ($('#noCheese').is(':checked')) {
            $("#cheese").append("&bull; No Cheese");
        } else if ($('#extraCheese').is(':checked')) {
            $("#cheese").append("&bull; Extra Cheese");
            var subtotalCheese = 3;
        }

        // APPEND VEG TO RECEIPT
        if ($('#tomatoes').is(':checked')) {
            $("#veg").append("&bull; Tomatoes<br>");
        }
        if ($('#onions').is(':checked')) {
            $("#veg").append("&bull; Onions<br>");
        }
        if ($('#olives').is(':checked')) {
            $("#veg").append("&bull; Olives<br>");
        }
        if ($('#greenPeppers').is(':checked')) {
            $("#veg").append("&bull; Green Peppers<br>");
        }
        if ($('#mushrooms').is(':checked')) {
            $("#veg").append("&bull; Mushrooms<br>");
        }
        if ($('#pineapple').is(':checked')) {
            $("#veg").append("&bull; Pineapple<br>");
        }
        if ($('#spinach').is(':checked')) {
            $("#veg").append("&bull; Spinach<br>");
        }
        if ($('#jalapeno').is(':checked')) {
            $("#veg").append("&bull; Jalapeño<br>");
        }

        // APPEND MEAT TO RECEIPT
        if ($('#pepperoni').is(':checked')) {
            $("#meat").append("&bull; Pepperoni<br>");
        }
        if ($('#sausage').is(':checked')) {
            $("#meat").append("&bull; Sausage<br>");
        }
        if ($('#canadianBacon').is(':checked')) {
            $("#meat").append("&bull; Canadian Bacon<br>");
        }
        if ($('#groundBeef').is(':checked')) {
            $("#meat").append("&bull; Ground Beef<br>");
        }
        if ($('#anchovy').is(':checked')) {
            $("#meat").append("&bull; Anchovy<br>");
        }
        if ($('#chicken').is(':checked')) {
            $("#meat").append("&bull; Chicken<br>");
        }

        // CALCULATE AND APPEND ITEMIZED SUBTOTALS

            //SIZE SUBTOTAL
            $("#size").append("<br>size subtotal: $ " + subtotalSize);

            //CRUST SUBTOTAL
            $("#crust").append("<br>crust subtotal: $ " + subtotalCrust);

            //SAUCE SUBTOTAL
            $("#sauce").append("<br>sauce subtotal: $ " + subtotalSauce);

            //CHEESE SUBTOTAL
            $("#cheese").append("<br>cheese subtotal: $ " + subtotalCheese);

            //VEG SUBTOTAL
            var countVeg = $("#vegForm input:checked").length;
            if (countVeg < 2) {
                var subtotalVeg = 0;
            } 
            else var subtotalVeg = (countVeg - 1);
            $("#veg").append("veg subtotal: $ " + subtotalVeg);

            //MEAT SUBTOTAL
            var countMeat = $("#meatForm input:checked").length;
            if (countMeat < 2) {
                var subtotalMeat = 0;
            } 
            else var subtotalMeat = (countMeat - 1);
            $("#meat").append("meat subtotal: $ " + subtotalMeat);

        // CALCULATE AND APPEND GRAND TOTAL
        var grandTotal = (subtotalSize + subtotalCrust + subtotalSauce + subtotalCheese + subtotalVeg + subtotalMeat);
        $("#total").append("$" + grandTotal);

    }); // END CLICK FUNCTION

});