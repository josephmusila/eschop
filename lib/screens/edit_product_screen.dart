import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/providers/productsModel.dart';


class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  static const routeName="/edit-product";

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode=FocusNode();
  final _descriptionFocusNode=FocusNode();
  final _imageUrlController=TextEditingController();
  final _imageUrlFocusNode=FocusNode();
  final _form=GlobalKey<FormState>();
  var _editedProduct=Product(id: DateTime.now().toString(),title: "",description: "",imageUrl: "",price: 0);


  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
     _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl(){
    if(!_imageUrlFocusNode.hasFocus){
      setState(() {

      });
    }
  }
  void _saveForm(){
    final _isvalid=_form.currentState!.validate();
    if(!_isvalid){
      return;
    }
    _form.currentState!.save();
    Provider.of<ProvideProducts>(context,listen: false).addProduct(_editedProduct);
    Navigator.of(context).pop();
   /* print(_editedProduct.title);
    print(_editedProduct.description);
    print(_editedProduct.price);
    print(_editedProduct.imageUrl);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit product"),
        actions: [
          IconButton(onPressed: _saveForm, icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(

          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration:InputDecoration(
                  labelText: "Title",
                  errorStyle: TextStyle(
                    color: Colors.red,
                  )
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Please provide a value";
                  }
                  return null;
                },
                onSaved: (value){
                  _editedProduct=Product(
                      title: value!,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                    description: _editedProduct.description,
                    id: _editedProduct.id
                  );
                },
              ),
              TextFormField(
                decoration:InputDecoration(
                    labelText: "Price"
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter a price";
                  }
                  if(double.tryParse(value)==null){
                    return"Please enter a valid number";
                  }
                  if(double.parse(value)<=0){
                    return "please enter a number greater than zero";
                  }
                  return null;
                },
                onSaved: (value){
                  _editedProduct=Product(
                      title: _editedProduct.title,
                      price: double.parse(value!),
                      imageUrl: _editedProduct.imageUrl,
                      description: _editedProduct.description,
                      id: _editedProduct.id
                  );
                },
              ),
              TextFormField(
                decoration:InputDecoration(
                    labelText: "Description"
                ),
               focusNode: _descriptionFocusNode,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value){
                  _editedProduct=Product(
                      title: _editedProduct.title,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                      description: value!,
                      id: _editedProduct.id
                  );
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "please provide a description";
                  }
                  if(value.length<10){
                    return "should be Atleast 10 characters long";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Image Url",

                ),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                controller: _imageUrlController,
                focusNode: _imageUrlFocusNode,
                onFieldSubmitted: (_){
                  _saveForm();
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter an image url";
                  }
                  if(!value.startsWith('http') && !value.startsWith('https') ){
                    return "Please enter a valid URL";
                  }
                  if(!value.endsWith(".png") && !value.endsWith('.jpg') && !value.endsWith('.jpeg')){
                    return "Please enter a valid imageUrl";

                  }
                  return null;
                },
                onSaved: (value){
                  _editedProduct=Product(
                      title: _editedProduct.title,
                      price: _editedProduct.price,
                      imageUrl: value!,
                      description: _editedProduct.description,
                      id: _editedProduct.id
                  );
                },
              ),
              Container(
                height: 300,

                //09:12

                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    )
                ),
                child: _imageUrlController.text.isEmpty? Text("enter url"): FittedBox(
                  child: Image.network(_imageUrlController.text,fit: BoxFit.cover,),
                ),
              ),


              /*

                */
            ],
          ),
        ),
      ),
    );
  }
}
