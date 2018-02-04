import { Component, OnInit } from '@angular/core';
import { DataService } from './../../services/data.service';

@Component({
  selector: 'app-requisitions',
  templateUrl: './requisitions.component.html',
  styleUrls: ['./requisitions.component.css']
})
export class RequisitionsComponent implements OnInit {
  requisitions:Requisition[];

  constructor(private ds:DataService) { }

  ngOnInit() {
    this.ds.getRequisitions().subscribe((requisitions) =>{
      this.requisitions = requisitions;
    });
  }
}

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