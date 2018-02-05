import { Injectable } from '@angular/core';
import { Http, Headers } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class DataService {
  public headers:Headers;

  constructor(public http:Http) { 
    this.headers = new Headers();
    this.headers.append('Content-Type', 'application/x-www-form-urlencoded');
  }

  getRequisitions(){
    return this.http.get('http://localhost/api/requisitions/read.php').map(res => res.json()); 
  }

  getProducts(){
    return this.http.get('http://localhost/api/products/read.php').map(res => res.json());
  }

  getProductQuantity(product_id){
    return this.http.get('http://localhost/api/products/read_quantity.php?product_id=' + product_id).map(res => res.json());
  }
}
