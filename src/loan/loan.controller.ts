import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LoanService } from './loan.service';
import { loan } from '@prisma/client';

@Controller('loan')
export class LoanController {
  constructor(private readonly loanService: LoanService) {}

  @Post()
  async create(@Body() date: loan) {
    return this.loanService.create(date);
  }

  @Get()
  async findAll() {
    return this.loanService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    return this.loanService.findOne(+id);
  }

  @Patch(':id')
  async update(@Param('id') id: string, @Body() date: loan) {
    return this.loanService.update(+id, date);
  }

  @Delete(':id')
  async remove(@Param('id') id: string) {
    return this.loanService.remove(+id);
  }
}
