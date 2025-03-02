<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'category_id',
    ];

    public function productCategory()
    {
        return $this->belongsTo(ProductCategory::class, 'category_id');
    }
}
