import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { BookService } from './book.service';
import { book } from '@prisma/client';

@Controller('book')
export class BookController {
  constructor(private readonly bookService: BookService) {}

  @Post()
  async create(@Body() data: book) {
    return this.bookService.create(data);
  }

  @Get()
  async findAll() {
    return this.bookService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    return this.bookService.findOne(+id);
  }

  @Patch(':id')
  async update(@Param('id') id: string, @Body() data: book) {
    return this.bookService.update(+id, data);
  }

  @Delete(':id')
  async remove(@Param('id') id: string) {
    return this.bookService.remove(+id);
  }
}
