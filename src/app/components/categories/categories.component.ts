import { Component, OnInit } from '@angular/core';
import { Category } from '../../interfaces/interfaces';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.css']
})
export class CategoriesComponent implements OnInit {
  categories: Category[];
  message: string;

  constructor(private ds: DataService) { }

  ngOnInit() {
    this.ds.getCategories().subscribe((data)=>{
      console.log(data);
      this.categories = data.categories;
      
      this.message = "";
      for (let error of data.errors) {
        this.message += error;
      }
    });
  }
}
