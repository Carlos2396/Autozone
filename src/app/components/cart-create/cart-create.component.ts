import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import { Message } from '@angular/compiler/src/i18n/i18n_ast';

@Component({
  selector: 'app-cart-create',
  templateUrl: './cart-create.component.html',
  styleUrls: ['./cart-create.component.css']
})
export class CartCreateComponent implements OnInit {
  products: Product[];
  selected: Selected[];
  message: string;
  input: any;
  client:string;
  total: number;

  constructor(private ds: DataService) { }

  ngOnInit() {
    this.ds.getProducts().subscribe((products) => {
      this.products = products;
    });
    this.selected = [];
    this.message = null;
    this.input = "";
    this.total = 0;
    this.client = "";
  }

  addProduct() {
    for(let i=0; i<this.products.length; i++){
      if(this.products[i].id == this.input || this.products[i].name == this.input || this.products[i].secondary_id == this.input){
        if(!this.notInSelected(this.products[i])){
          this.selected.unshift({
            product: this.products[i],
            quantity: 1
          });
          this.message = null;
          this.input = "";
          this.updateTotal();
        }
        else{
          this.message = "Este producto ya está en el carrito.";
          this.input = "";
        }

        return false;
      }
    }
    this.message = "Producto no encontrado.";
    return false;
  }

  deleteProduct(index){
    this.selected.splice(index, 1);
    this.updateTotal();
  }

  notInSelected(product){
    for(let i=0; i<this.selected.length; i++){
      if(this.selected[i].product == product)
        return true;
    }
    return false;
  }

  updateTotal(){
    this.total = 0;
    for(let i=0; i<this.selected.length; i++){
      this.total += this.selected[i].product.price * this.selected[i].quantity;
    }
  }

  validate(){
    if(this.client.length < 1){
      this.message = "Debes escribir el nombre del cliente.";
      return false;
    }

    if(this.selected.length == 0){
      this.message = "Debes incluir al menos un producto.";
      return false;
    }

    for(let i=0; i<this.selected.length; i++){
      if(!this.validateQuantity(this.selected[i])){
        return false;
      }
    }

    return true;
  }

  validateQuantity(sel){
    if(sel.quantity <= 0){
      sel.quantity = 1;
      return false;
    }
    
    let max;
    this.ds.getProductQuantity(sel.product.id).subscribe((data) => {
      max = data.quantity;  
      if(sel.quantity > max){
        sel.quantity = max;
        this.message = "Sólo se cuenta con " + max + " unidades de " + sel.product.name + " en inventario.";
        return false;
      }
    });

    this.updateTotal();
    return true;
  }

  makeSale(){
    if(this.validate()){
      //make post

      //if(valid)
      window.open('/compras', '_self');
      //else
      /*show message*/
    }
  }
}

interface Product {
  id: number,
  secondary_id: number,
  name: string,
  description: string,
  brand: string,
  category: string,
  quantity: number,
  price: number
}

interface Selected{
  product:Product,
  quantity: number
}