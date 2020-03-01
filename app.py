#!/usr/bin/env python
import click

@click.command()
def hello():
    click.echo('Hello we will build docker locally in cloud9 then push it to docker hub with script.')

if __name__ == '__main__':
    hello()
