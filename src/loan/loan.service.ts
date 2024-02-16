import { Injectable } from '@nestjs/common';
import { loan } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class LoanService {
  constructor(private prisma: PrismaService) {}
  async create(data: loan) {
    return this.prisma.loan.create({
      data,
    });
  }

  async findAll() {
    return this.prisma.loan.findMany();
  }

  async findOne(id: number) {
    return this.prisma.loan.findUnique({
      where: {
        id,
      },
    });
  }

  async update(id: number, data: loan) {
    return this.prisma.loan.update({
      where: {
        id,
      },
      data,
    });
  }

  async remove(id: number) {
    return this.prisma.loan.delete({
      where: {
        id,
      },
    });
  }
}
