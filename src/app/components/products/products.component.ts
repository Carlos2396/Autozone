/*
  Componente que se eencarga de mostrar el inventario de una sucursal.
*/

import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  message:string;
  products:Product[]; // todos los productos de la sucursal

  constructor(private ds:DataService) { } // se inyecta el servicio para realizar peticiones al backend

  // Método que inicializa las variables
  ngOnInit() {
    // Peticion GET que obtiene todos los productos de una sucursal
    this.ds.getProducts().subscribe((data)=>{
      this.products = data.products;

      this.message = "";
      for (let error of data.errors) {
        this.message += error;
      }
    });
  }
}

// Interfaz que representa un producto
interface Product{
  id:number,
  secondary_id:number,
  name:string,
  description:string,
  brand:string,
  category:string,
  quantity:number,
  price: number
}