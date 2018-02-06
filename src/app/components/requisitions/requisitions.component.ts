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
  requisitions:Requisition[]; // todas las ventas de la sucursal

  constructor(private ds:DataService) { } // se inyecta el servicio para realizar peticiones al backend

  //Método que inicializa las variables
  ngOnInit() {
    // Peticion GET que obtiene todos los productos de una sucursal
    this.ds.getRequisitions().subscribe((requisitions) =>{
      this.requisitions = requisitions;
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