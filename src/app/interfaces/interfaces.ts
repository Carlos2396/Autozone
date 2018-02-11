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
    completed:string,
    client:string,
    payment_type:string,
    delivery:string,
    created_at:string
}

export interface Data{
    client:string,
    cart: Selected[]
}

export interface Purchase{
    id: number,
    branch: string,
    provider: string,
    company: string,
    cart: Selected[]
}