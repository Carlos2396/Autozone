import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  products:Product[];

  constructor(private ds:DataService) { }

  ngOnInit() {
    this.ds.getProducts().subscribe((products)=>{
      this.products = products;
    })
  }
}

interface Product{
  id:number,
  secondary_id:number,
  name:string,
  description:string,
  brand:string,
  category:string,
  quantity:number
}
