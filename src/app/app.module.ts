import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';


import { AppComponent } from './app.component';

import { DataService } from './services/data.service';
import { RequisitionsComponent } from './components/requisitions/requisitions.component';
import { ProductsComponent } from './components/products/products.component';

@NgModule({
  declarations: [
    AppComponent,
    RequisitionsComponent,
    ProductsComponent
  ],
  imports: [
    BrowserModule,
    HttpModule
  ],
  providers: [
    DataService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
