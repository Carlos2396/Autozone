import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import { Product, SalePerHour } from '../../interfaces/interfaces';

@Component({
  selector: 'app-hourly-sales',
  templateUrl: './hourly-sales.component.html',
  styleUrls: ['./hourly-sales.component.css']
})
export class HourlySalesComponent implements OnInit {
  message:string;
  salesPerHour:SalePerHour[];

  constructor(private ds: DataService) { }

  ngOnInit() {
    // Peticion GET que obtiene todos los productos de una sucursal
    this.ds.getSalesPerHour().subscribe((data)=>{
      this.salesPerHour = data.salesPerHour;

      this.message = "";
      for (let error of data.errors) {
        this.message += error;
      }
    });
  }

}
