import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { RouterModule, Routes } from '@angular/router';


import { AppComponent } from './app.component';

import { DataService } from './services/data.service';
import { RequisitionsComponent } from './components/requisitions/requisitions.component';
import { ProductsComponent } from './components/products/products.component';

const appRoutes:Routes = [
  {path:'compras', component:RequisitionsComponent},
  {path:'inventario', component:ProductsComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    RequisitionsComponent,
    ProductsComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [
    DataService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
