$.getJSON("http://localhost:8081/ServicePayment/ServiceProduct/ProductService", function(userData){
        var responseObj = JSON.parse(JSON.stringify(userData));

        $.each(responseObj,function(i,product){
          appendToProductTable(product);
      });

});


$("form").submit(function(e) {
    e.preventDefault();
});

$("form#addProduct").submit(function() {
    var product = {};
    var productCode = $('input[name="Product_Code"]').val().trim();
    var productName = $('input[name="ProdName"]').val().trim();
    var contributors = $('input[name="Contributors"]').val().trim();
    var email = $('input[name="Email"]').val().trim();
    var price = $('input[name="Price"]').val().trim();

    if(productCode && productName && contributors && email && price){
        $(this).serializeArray().map(function(data) {
            product[data.name] = data.value;
        });

        addProduct(product)
          
    }else{
        alert("You must have filled all fields");
    }
    
});

function addProduct(product){
  $.ajax({
    async:true,
    type:"POST",
    url:"http://localhost:8081/ServicePayment/ServiceProduct/ProductService?=",
    data:JSON.stringify({ product }),
    contentType: 'application/json',
  });
}



function editProduct(id) {
  $.getJSON("http://localhost:8081/ServicePayment/ServiceProduct/ProductService?=", function(userData){
        var responseObj = JSON.parse(JSON.stringify(userData));
        responseObj.forEach(function(product, i) {
          if (product.Prod_ID == id) {
            $(".modal-body").empty().append(`
                      <form id="updateProduct" action="">
                          <label for="Product_Code">Product Code</label>
                          <input class="form-control" type="text" name="Product_Code" value="${product.Product_Code}"/>
                          <label for="Product_Name">Product Name</label>
                          <input class="form-control" type="text" name="ProdName" value="${product.ProdName}"/>
                          <label for="Contributors">Contributors</label>
                          <input class="form-control" type="text" name="Contributors" value="${product.Contributors}"/>
                          <label for="Email">Email</label>
                          <input class="form-control" type="text" name="Email" value="${product.Email}"/>
                          <label for="Price">Price</label>
                          <input class="form-control" type="text" name="Price" value="${product.Price}"/>
            `);
            $(".modal-footer").empty().append(`
                          <button type="button" type="submit" class="btn btn-primary" data-dismiss="modal" onClick="updateProduct(${id})">Save changes</button>
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </form>
            `);
          }
        });
  });
    
}


function deleteProduct(id) {
  $.ajax({
    type:"DELETE",
    url:"http://localhost:8081/ServicePayment/ServiceProduct/ProductService?=",
    data:`<productsData><Prod_ID>${id}</Prod_ID></productsData>`,
    contentType: 'text/xml',
  });
}



function updateProduct(id) {
    var product2 = {};
    product2.Prod_ID = id;

    $("#updateProduct").children("input").each(function(){
      product2[$(this).attr("name")] = $(this).val();
    })
    console.log(product2);

    $.ajax({
      async:true,
      type:"PUT",
      url:"http://localhost:8081/ServicePayment/ServiceProduct/ProductService?=",
      data:JSON.stringify({ product2 }),
      contentType: 'application/json',
      success:function(){
        alert("success")
      }
    });
}

function flashMessage(msg) {
    $(".flashMsg").remove();
    $(".row").prepend(`
          <div class="col-sm-12"><div class="flashMsg alert alert-success alert-dismissible fade in text-success" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>${msg}</strong></div></div>
    `);
}






function appendToProductTable(product) {
    
    $("#productTable > tbody:last-child").append(`
          <tr id="user-${product.id}">
              <td class="productData" name="id">${product.Prod_ID}</td>
              '<td class="productData" name="product_code">${product.Product_Code}</td>
              '<td class="productData" name="product_name">${product.ProdName}</td>
              '<td class="productData" name="contributors">${product.Contributors}</td>
              '<td class="productData" name="email">${product.Email}</td>
              '<td id="tdAge" class="productData" name="price">${product.Price}</td>
              '<td align="center">
                  <button class="btn btn-success form-control" onClick="editProduct(${product.Prod_ID})" data-toggle="modal" data-target="#myModal")">EDIT</button>
              </td>
              <td align="center">
                  <button class="btn btn-danger form-control" onClick="deleteProduct(${product.Prod_ID})">DELETE</button>
              </td>
          </tr>
      `)
};










