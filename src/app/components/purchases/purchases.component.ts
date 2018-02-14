import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import { Purchase } from '../../interfaces/interfaces';

@Component({
  selector: 'app-purchases',
  templateUrl: './purchases.component.html',
  styleUrls: ['./purchases.component.css']
})
export class PurchasesComponent implements OnInit {
  purchases: Purchase[];
  message: string;
  
  constructor(private ds: DataService) { } // se inyecta el servicio para realizar peticiones al backend

  ngOnInit() {
    this.message = "";
    
    this.ds.getPurchases().subscribe((data) =>{
      this.purchases = data.purchases;
      this.message = "";
      for (let error of data.errors) {
        this.message += error;
      }
    });
  }
}