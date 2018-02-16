import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-daily-sales',
  templateUrl: './daily-sales.component.html',
  styleUrls: ['./daily-sales.component.css']
})
export class DailySalesComponent implements OnInit {
  date: string;
  mount: number;
  message: string;

  constructor(private ds: DataService) { }

  ngOnInit() {
    this.mount = null;
    this.message = "";
  }

  searchSales(){
    //console.log(this.date.toString());
    this.ds.getDaySales(this.date).subscribe((data)=>{
      this.mount = data.mount;
      console.log(data);
      this.message = "";
      for (let error of data.errors) {
        this.message += error;
      }
    });
    return false;
  }

}
