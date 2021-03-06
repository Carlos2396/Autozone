import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import { Message } from '@angular/compiler/src/i18n/i18n_ast';
import { Product, Selected } from '../../interfaces/interfaces';

@Component({
  selector: 'app-requisitions-create',
  templateUrl: './requisitions-create.component.html',
  styleUrls: ['./requisitions-create.component.css']
})
export class RequisitionsCreateComponent implements OnInit {
  products: Product[]; // todos los productos de la sucursal
  selected: Selected[]; // productos en el carrito
  message: string; // mensaje de errores
  input: any; // input del usuario
  client: string; // nombre del cliente
  total: number; // valor total de la venta

  constructor(private ds: DataService) { } // se inyecta el servicio para realizar peticiones al backend

  // Método que inicializa todas las variables
  ngOnInit() {
    // Peticion GET que obtiene todos los productos de una sucursal
    this.ds.getProducts().subscribe((data) => {
      this.message = "";
      for (let error of data.errors) {
        this.message += error;
      }
      this.products = data.products;
    });
    this.selected = [];
    this.input = "";
    this.total = 0;
    this.client = "";
  }

  // Método que agrega un producto al carrito. Revisa que el producto exista en inventario.
  addProduct() {
    for (let i = 0; i < this.products.length; i++) {
      if (this.products[i].id == this.input || this.products[i].name == this.input || this.products[i].secondary_id == this.input) {
        if (!this.notInSelected(this.products[i])) {
          if(this.products[i].quantity > 0){
            this.selected.unshift({
              product: this.products[i],
              quantity: 1
            });
            this.message = null;
            this.input = "";
            this.updateTotal();
          }
          else{
            this.message = "El producto " + this.products[i].name + " se ha agotado."; 
          }
        }
        else {
          this.message = "Este producto ya está en el carrito.";
          this.input = "";
        }

        return false;
      }
    }
    this.message = "Producto no encontrado.";
    return false;
  }

  // Método que elimina un producto del carrito
  deleteProduct(product) {
    for (let i = 0; i < this.selected.length; i++) {
      if (this.selected[i].product == product)
        this.selected.splice(i, 1);
    }
    this.updateTotal();
  }

  // Revisa si un producto ya está en el carrito
  notInSelected(product) {
    for (let i = 0; i < this.selected.length; i++) {
      if (this.selected[i].product == product)
        return true;
    }
    return false;
  }

  // Actualiza el valor del total
  updateTotal() {
    this.total = 0;
    for (let i = 0; i < this.selected.length; i++) {
      this.total += this.selected[i].product.price * this.selected[i].quantity;
    }
  }

  // Valida que se cuente con un cliente y las cantidades de los productos
  validate() {
    if (this.client.length < 1) {
      this.message = "Debes escribir el nombre del cliente.";
      return false;
    }

    if (this.selected.length == 0) {
      this.message = "Debes incluir al menos un producto.";
      return false;
    }

    for (let i = 0; i < this.selected.length; i++) {
      if (!this.validateQuantity(this.selected[i])) {
        return false;
      }
    }

    return true;
  }

  // Valida que la cantidad del producto sea mayor a 0 y menor o igual al inventario en ese momento.
  validateQuantity(sel) {
    sel.quantity = Math.floor(sel.quantity);
    if (sel.quantity <= 0) {
      sel.quantity = 1;
    }

    let max;
    this.ds.getProductQuantity(sel.product.id).subscribe((data) => {
      max = data.quantity;
      if (sel.quantity > max) {
        sel.quantity = max;
        this.message = "Sólo se cuenta con " + max + " unidades de " + sel.product.name + " en inventario.";
      }

      if(max == 0){
        this.message = "El producto " + sel.product.name + " se ha agotado.";
        this.deleteProduct(sel.product);
      }

      this.updateTotal();
      return false;
    });

    this.updateTotal();
    return true;
  }

  // Método que realiza la peticion POST para registrar una venta
  makeSale() {
    if (this.validate()) {
      this.ds.postRequisition(this.client, this.selected).subscribe((data) => {
        if (data.errors.length > 0) { // si falla la transacción
          this.message = "";
          for (let error of data.errors) {
            this.message += error;
          }
          return false;
        }
        else { // si funciona la transacción
          window.open('ventas', '_SELF');
        }
      });
    }

    return false;
  }
}
