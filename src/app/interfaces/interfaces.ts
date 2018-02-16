export interface Product {
    id: number,
    secondary_id: number,
    name: string,
    description: string,
    brand: string,
    category: string,
    quantity: number,
    price: number,
    purchase: number
}

export interface Selected {
    product: Product,
    quantity: number
}

export interface Requisition{
    id:number,
    total:number,
    branch:string,
    status:string,
    completed:Date,
    client:string,
    payment_type:string,
    delivery:string,
    created_at: Date,
    cart: number
}

export interface Data{
    client:string,
    cart: Selected[]
}

export interface Purchase{
    id: number,
    product_id: number
    name: string,
    brand: string,
    price: number,
    quantity: number,
    created_at: string,
    done: boolean
}

export interface SalePerHour{
    id: number,
    total: number,
    created_at: string
}