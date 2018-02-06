/*
  Componente que se encarga de mostrar las ventas de una sucursal
*/

import { Component, OnInit } from '@angular/core';
import { DataService } from './../../services/data.service';

@Component({
  selector: 'app-requisitions',
  templateUrl: './requisitions.component.html',
  styleUrls: ['./requisitions.component.css']
})
export class RequisitionsComponent implements OnInit {
  message:string;
  requisitions:Requisition[]; // todas las ventas de la sucursal

  constructor(private ds:DataService) { } // se inyecta el servicio para realizar peticiones al backend

  //Método que inicializa las variables
  ngOnInit() {
    this.message = "";
    // Peticion GET que obtiene todos los productos de una sucursal
    this.ds.getRequisitions().subscribe((data) =>{
      this.requisitions = data.requisitions;
      this.message = "";
      for (let error of data.errors) {
        this.message += error;
      }
    });
  }
}

//Interface que representa una venta
interface Requisition{
  id:number,
  total:number,
  branch:string,
  status:string,
  completed:string,
  client:string,
  payment_type:string,
  delivery:string,
  created_at:string
}