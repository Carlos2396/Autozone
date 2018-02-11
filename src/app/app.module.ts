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
import { PurchasesComponent } from './components/purchases/purchases.component';
import { PurchasesCreateComponent } from './components/purchases-create/purchases-create.component';

const appRoutes:Routes = [
  {path:'inventario', component:ProductsComponent},
  {path:'ventas', component:RequisitionsComponent},
  {path:'ventas/crear', component:CartCreateComponent},
  {path:'compras', component:PurchasesComponent},
  {path:'compras/crear', component:PurchasesCreateComponent},
  {path:'', redirectTo:'inventario', pathMatch: 'full'}
];

@NgModule({
  declarations: [
    AppComponent,
    RequisitionsComponent,
    ProductsComponent,
    CartCreateComponent,
    PurchasesComponent,
    PurchasesCreateComponent
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
