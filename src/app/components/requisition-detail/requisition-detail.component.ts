import { Component, OnInit, Input, Output, EventEmitter, OnChanges, SimpleChanges, SimpleChange } from '@angular/core';
import { Requisition, Selected } from '../../interfaces/interfaces';
import { DataService } from './../../services/data.service';

@Component({
  selector: 'app-requisition-detail',
  templateUrl: './requisition-detail.component.html',
  styleUrls: ['./requisition-detail.component.css']
})
export class RequisitionDetailComponent implements OnInit {
  @Input() requisition: Requisition;
  @Output() onClosed = new EventEmitter<boolean>();
  cart: Selected[];

  constructor(private ds:DataService) { } // se inyecta el servicio para realizar peticiones al backend

  ngOnInit() {
    this.cart = null;
  }

  ngOnChanges(changes: SimpleChanges) {
    if(this.requisition != null){
      this.ds.getCart(this.requisition.cart).subscribe((data) =>{
        this.cart = data.cart;
      });
    }
  }

  hide(){
    this.requisition = null;
    this.onClosed.emit(true);
  }
}
