import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import { Product, Selected } from '../../interfaces/interfaces';

@Component({
  selector: 'app-purchases-create',
  templateUrl: './purchases-create.component.html',
  styleUrls: ['./purchases-create.component.css']
})
export class PurchasesCreateComponent implements OnInit {
  products: Product[]; // todos los productos de la sucursal
  selected: Selected[]; // productos en el carrito
  message: string; // mensaje de errores
  input: any; // input del usuario
  total: number; // valor total de la compra

  constructor(private ds: DataService) { } // se inyecta el servicio para realizar peticiones al backend

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
  }

  // Método que agrega un producto al carrito. Revisa que el producto exista en inventario.
  addProduct() {
    for (let i = 0; i < this.products.length; i++) {
      if (this.products[i].id == this.input || this.products[i].name == this.input || this.products[i].secondary_id == this.input) {
        if (!this.notInSelected(this.products[i])) {
          this.selected.unshift({
            product: this.products[i],
            quantity: 1
          });
          this.message = null;
          this.input = "";
          this.updateTotal();
        }
        else {
          this.message = "Este producto ya está en la lista.";
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

  // Valida que la cantidad del producto sea mayor a 0 y menor o igual al inventario en ese momento.
  validateQuantity(sel) {
    sel.quantity = Math.floor(sel.quantity);
    if (sel.quantity <= 0) {
      this.message = "Debes de comprar al menos un " + sel.product.name + ".";
      sel.quantity = 1;
    }

    this.updateTotal();
    return true;
  }

  // Método que realiza la peticion POST para registrar una venta
  /*makePurchase() {
    this.ds.postPurchase(this.selected).subscribe((data) => {
      if (data.errors.length > 0) { // si falla la transacción
        this.message = "";
        for (let error of data.errors) {
          this.message += error;
        }
        return false;
      }
      else { // si funciona la transacción
        window.open('compras', '_SELF');
      }
    });

    return false;
  }*/
}