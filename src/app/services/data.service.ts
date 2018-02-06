/**
 * Servicio que se encarga de realizar las peticiones al backend.
 */

import { Injectable } from '@angular/core';
import { Http, Headers } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class DataService {
  public headers:Headers;
  public url:string;

  constructor(public http:Http) {
    this.url = 'http://10.50.117.22/'; // url del servidor donde se encuentra la api
    this.headers = new Headers();
    this.headers.append('Content-Type', 'application/json');
  }

  getRequisitions(){
    return this.http.get(this.url + 'api/requisitions/read.php').map(res => res.json()); 
  }

  getProducts(){
    return this.http.get(this.url + 'api/products/read.php').map(res => res.json());
  }

  getProductQuantity(product_id){
    return this.http.get(this.url + 'api/products/read_quantity.php?product_id=' + product_id).map(res => res.json());
  }

  postRequisition(client:string, cart:Selected[]){
    let data:Data;
    data = {client: client, cart: cart};

    return this.http.post(
      this.url + 'api/requisitions/create-req.php',
      JSON.stringify(data),
    {
      method: 'POST',
      headers: this.headers
    }).map(res => res.json());
  }
}

interface Product {
  id: number,
  secondary_id: number,
  name: string,
  description: string,
  brand: string,
  category: string,
  quantity: number,
  price: number
}

interface Selected{
  product:Product,
  quantity: number
}

interface Data{
  client:string,
  cart: Selected[]
}