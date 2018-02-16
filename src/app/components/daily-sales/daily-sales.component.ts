import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import { Requisition } from '../../interfaces/interfaces';

@Component({
  selector: 'app-daily-sales',
  templateUrl: './daily-sales.component.html',
  styleUrls: ['./daily-sales.component.css']
})
export class DailySalesComponent implements OnInit {
  date: Date;
  message:string;
  requisitions:Requisition[]; // todas las ventas de la sucursal
  detail:Requisition;

  constructor(private ds: DataService) { }

  ngOnInit() {
    this.detail = null;
    this.message = "";
    this.requisitions = null;
  }

  searchSales(){
    this.ds.getDaySales(this.date).subscribe((data) =>{
      this.requisitions = data.requisitions;
      this.message = "";
      for (let error of data.errors) {
        this.message += error;
      }
    });
    return false;
  }

  showDetail(requisition:Requisition){
    this.detail = requisition;
  }

  onClosed(closed:boolean){
    this.detail = null;
  }
}
