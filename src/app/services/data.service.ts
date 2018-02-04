import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class DataService {

  constructor(public http:Http) { 

  }

  getRequisitions(){
    return this.http.get('http://localhost/api/requisitions/read.php').map(res => res.json()); 
  }

}
