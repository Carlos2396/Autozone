import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule } from '@angular/forms';


import { AppComponent } from './app.component';

import { DataService } from './services/data.service';
import { RequisitionsComponent } from './components/requisitions/requisitions.component';
import { ProductsComponent } from './components/products/products.component';
import { CartCreateComponent } from './components/cart-create/cart-create.component';

const appRoutes:Routes = [
  {path:'compras', component:RequisitionsComponent},
  {path:'inventario', component:ProductsComponent},
  {path:'registro', component:CartCreateComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    RequisitionsComponent,
    ProductsComponent,
    CartCreateComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [
    DataService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
